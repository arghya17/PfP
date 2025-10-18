#include <atomic>
#include <cassert>
#include <chrono>
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <pthread.h>
#include <bits/stdc++.h>
using namespace std;
using std::cerr;
using std::cout;
using std::endl;

using HR = std::chrono::high_resolution_clock;
using HRTimer = HR::time_point;
using std::chrono::duration_cast;
using std::chrono::microseconds;
using std::chrono::milliseconds;

#define N (1e7)
#define NUM_THREADS (16)

// Shared variables
uint64_t var1 = 0, var2 = (N * NUM_THREADS + 1);
static std::atomic<uint64_t> heartbeat[NUM_THREADS];
struct alignas(64) padded_uint64_t
{
    volatile uint64_t value;
    char pad[64 - sizeof(uint64_t)];
};
struct alignas(64) padded_boolean
{
    volatile bool value;
    char pad[64 - sizeof(bool)];
};
// Abstract base class
class LockBase
{
public:
    // Pure virtual function
    virtual void acquire(uint16_t tid) = 0;
    virtual void release(uint16_t tid) = 0;
};

typedef struct thr_args
{
    uint16_t m_id;
    LockBase *m_lock;
} ThreadArgs;

static inline bool cas32(volatile uint32_t *addr, uint32_t oldVal, uint32_t newVal)
{
    unsigned char result;
    asm volatile(
        "lock cmpxchgl %3, %0 \n sete %1"
        : "+m"(*addr), "=q"(result), "+a"(oldVal) // loads oldVal into EAX
        : "r"(newVal)
        : "memory");
    return result;
}
/** Use pthread mutex to implement lock routines */
class PthreadMutex : public LockBase
{
public:
    void acquire(uint16_t tid) override
    {
        pthread_mutex_lock(&lock);
    }
    void release(uint16_t tid) override
    {
        pthread_mutex_unlock(&lock);
    }

private:
    pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;
};

class FilterLock : public LockBase
{
private:
    alignas(64) padded_uint64_t *levels;
    alignas(64) padded_uint64_t *victim;

public:
    FilterLock(int n)
    {
        levels = new padded_uint64_t[n];
        victim = new padded_uint64_t[n];
        for (int i = 0; i < n; i++)
        {
            levels[i].value = 0;
        }
    }
    void acquire(uint16_t tid) override
    {
        int level;
        for (level = 1; level < NUM_THREADS; level++)
        {
            levels[tid].value = level;
            victim[level].value = tid;
            asm volatile("mfence" ::: "memory");
            for (int k = 0; k < NUM_THREADS; k++)
            {
                while (k != tid && levels[k].value >= level && victim[level].value == tid)
                {
                    asm volatile("pause" ::: "memory");
                    // busy wait
                }
            }
        }
    }
    void release(uint16_t tid) override
    {
        asm volatile("mfence" ::: "memory");
        levels[tid].value = 0;
    }

    ~FilterLock() {}
};

class BakeryLock : public LockBase
{
    padded_boolean *choosing;
    padded_uint64_t *label;

public:
    BakeryLock()
    {
        choosing = new padded_boolean[NUM_THREADS];
        label = new padded_uint64_t[NUM_THREADS];
        for (int i = 0; i < NUM_THREADS; i++)
        {
            choosing[i].value = false;
            label[i].value = 0;
        }
    }
    void acquire(uint16_t tid) override
    {
        choosing[tid].value = true;
        asm volatile("mfence" ::: "memory");
        uint64_t max = 0;
        for (int i = 0; i < NUM_THREADS; i++)
        {
            uint64_t num = label[i].value;
            if (num > max)
                max = num;
        }
        label[tid].value = max + 1;
        asm volatile("mfence" ::: "memory");
        choosing[tid].value = false;
        for (int j = 0; j < NUM_THREADS; j++)
        {
            // Wait until thread j receives its label:
            while (choosing[j].value)
            {
                asm volatile("pause" ::: "memory");
            }
            // Wait until all threads with smaller labels or with the same label, but with higher priority, finish their work:
            while (label[j].value != 0 && (label[j].value < label[tid].value || (label[j].value == label[tid].value && j < tid)))
            {
                asm volatile("pause" ::: "memory");
            }
        }
    }
    void release(uint16_t tid) override
    {
        asm volatile("mfence" ::: "memory");
        label[tid].value = 0;
    }
    ~BakeryLock() {}
};

class SpinLock : public LockBase
{
    uint32_t lock;

public:
    void acquire(uint16_t tid) override
    {

        while (!cas32(&lock, 0, 1))
        {
            asm volatile("" ::: "memory");
        }
    }
    void release(uint16_t tid) override
    {
        asm volatile("" ::: "memory");
        lock = 0;
    }

    SpinLock()
    {
        lock = 0;
    }
    ~SpinLock() {}
};

class TicketLock : public LockBase
{
    padded_uint64_t next_ticket;
    padded_uint64_t now_serving;

public:
    void acquire(uint16_t tid) override
    {
        uint64_t my_ticket = __atomic_fetch_add(&next_ticket.value, 1, __ATOMIC_SEQ_CST);
        asm volatile("mfence" ::: "memory");
        while (now_serving.value != my_ticket)
        {
            asm volatile("" ::: "memory");
        }
    }
    void release(uint16_t tid) override
    {
        asm volatile("mfence" ::: "memory");
        __atomic_fetch_add(&now_serving.value, 1, __ATOMIC_SEQ_CST);
    }

    TicketLock()
    {
        next_ticket.value = 0;
        now_serving.value = 0;
    }
    ~TicketLock() {}
};

class ArrayQLock : public LockBase
{
    uint64_t tail;
    padded_boolean *flag;
    uint16_t size;
    static thread_local uint64_t my_slot;
    // thread_local variable to hold the slot number of the thread

public:
    void acquire(uint16_t tid) override
    {
        uint64_t slot = __atomic_fetch_add(&tail, 1, __ATOMIC_SEQ_CST) % size;
        asm volatile("mfence" ::: "memory");
        my_slot = slot;
        asm volatile("mfence" ::: "memory");
        while (!flag[my_slot].value)
        {
            asm volatile("mfence" ::: "memory");
        }
    }
    void release(uint16_t tid) override
    {
        flag[my_slot].value = false;
        asm volatile("mfence" ::: "memory");
        flag[(my_slot + 1) % size].value = true;
    }

    ArrayQLock()
    {
        size = NUM_THREADS;
        tail = 0;
        flag = new padded_boolean[size];
        for (int i = 0; i < size; i++)
            flag[i].value = false;
        flag[0].value = true;
    }
    ~ArrayQLock() {}
};

/** Estimate the time taken */
std::atomic_uint64_t sync_time = 0;

void watchdog()
{
    uint64_t last[NUM_THREADS] = {0};

    while (true)
    {
        std::this_thread::sleep_for(std::chrono::seconds(2));
        bool stuck = true;

        for (int i = 0; i < NUM_THREADS; i++)
        {
            auto val = heartbeat[i].load(std::memory_order_relaxed);
            if (val != last[i])
            {
                stuck = false; // at least one thread made progress
                last[i] = val;
            }
        }

        if (stuck)
        {
            std::cerr << "[WATCHDOG] Possible deadlock! No progress in 2s.\n";
            abort(); // or break for debugging
        }
        else
        {
            std::cerr << "[WATCHDOG] Progress ok...\n";
        }
    }
}
inline void critical_section()
{
    var1++;
    var2--;
}

/** Sync threads at the start to maximize contention */
pthread_barrier_t g_barrier;

void *thrBody(void *arguments)
{
    ThreadArgs *tmp = static_cast<ThreadArgs *>(arguments);
    if (false)
    {
        cout << "Thread id: " << tmp->m_id << " starting\n";
    }

    // Wait for all other producer threads to launch before proceeding.
    pthread_barrier_wait(&g_barrier);

    HRTimer start = HR::now();
    for (int i = 0; i < N; i++)
    {
        tmp->m_lock->acquire(tmp->m_id);
        critical_section();
        heartbeat[tmp->m_id].fetch_add(1, std::memory_order_relaxed);
        tmp->m_lock->release(tmp->m_id);
    }
    HRTimer end = HR::now();
    auto duration = duration_cast<milliseconds>(end - start).count();

    // A barrier is not required here
    sync_time.fetch_add(duration);
    pthread_exit(NULL);
}
thread_local uint64_t ArrayQLock::my_slot = 0;
int main()
{
    int error = pthread_barrier_init(&g_barrier, NULL, NUM_THREADS);
    if (error != 0)
    {
        cerr << "Error in barrier init.\n";
        exit(EXIT_FAILURE);
    }

    pthread_attr_t attr;
    pthread_attr_init(&attr);
    pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_JOINABLE);
    std::thread wd(watchdog);
    wd.detach();
    pthread_t tid[NUM_THREADS];
    ThreadArgs args[NUM_THREADS] = {{0}};

    // Pthread mutex
    LockBase *lock_obj = new PthreadMutex();
    uint16_t i = 0;
    while (i < NUM_THREADS)
    {
        args[i].m_id = i;
        args[i].m_lock = lock_obj;

        error = pthread_create(&tid[i], &attr, thrBody, (void *)(args + i));
        if (error != 0)
        {
            cerr << "\nThread cannot be created : " << strerror(error) << "\n";
            exit(EXIT_FAILURE);
        }
        i++;
    }

    i = 0;
    void *status;
    while (i < NUM_THREADS)
    {
        error = pthread_join(tid[i], &status);
        if (error)
        {
            cerr << "ERROR: return code from pthread_join() is " << error << "\n";
            exit(EXIT_FAILURE);
        }
        i++;
    }

    assert(var1 == N * NUM_THREADS && var2 == 1);
    // cout << "Var1: " << var1 << "\tVar2: " << var2 << "\n";
    cout << "Pthread mutex: Time taken (us): " << sync_time << "\n";

    // Filter lock
    var1 = 0;
    var2 = (N * NUM_THREADS + 1);
    sync_time.store(0);

    lock_obj = new FilterLock(NUM_THREADS);
    i = 0;
    while (i < NUM_THREADS)
    {
        args[i].m_id = i;
        args[i].m_lock = lock_obj;

        error = pthread_create(&tid[i], &attr, thrBody, (void *)(args + i));
        if (error != 0)
        {
            printf("\nThread cannot be created : [%s]", strerror(error));
            exit(EXIT_FAILURE);
        }
        i++;
    }

    i = 0;
    while (i < NUM_THREADS)
    {
        error = pthread_join(tid[i], &status);
        if (error)
        {
            printf("ERROR: return code from pthread_join() is %d\n", error);
            exit(EXIT_FAILURE);
        }
        i++;
    }

    cout << "Var1: " << var1 << "\tVar2: " << var2 << "\n";
    // assert(var1 == N * NUM_THREADS && var2 == 1);
    cout << "Filter lock: Time taken (us): " << sync_time << "\n";

    // Bakery lock
    var1 = 0;
    var2 = (N * NUM_THREADS + 1);
    sync_time.store(0);

    lock_obj = new BakeryLock();
    i = 0;

    while (i < NUM_THREADS)
    {
        args[i].m_id = i;
        args[i].m_lock = lock_obj;

        error = pthread_create(&tid[i], &attr, thrBody, (void *)(args + i));
        if (error != 0)
        {
            printf("\nThread cannot be created : [%s]", strerror(error));
            exit(EXIT_FAILURE);
        }
        i++;
    }

    i = 0;
    while (i < NUM_THREADS)
    {
        error = pthread_join(tid[i], &status);
        if (error)
        {
            printf("ERROR: return code from pthread_join() is %d\n", error);
            exit(EXIT_FAILURE);
        }
        i++;
    }

    cout << "Var1: " << var1 << "\tVar2: " << var2 << "\n";
    // assert(var1 == N * NUM_THREADS && var2 == 1);
    cout << "Bakery lock: Time taken (us): " << sync_time << "\n";

    // Spin lock
    var1 = 0;
    var2 = (N * NUM_THREADS + 1);
    sync_time.store(0);

    lock_obj = new SpinLock();
    i = 0;
    while (i < NUM_THREADS)
    {
        args[i].m_id = i;
        args[i].m_lock = lock_obj;

        error = pthread_create(&tid[i], &attr, thrBody, (void *)(args + i));
        if (error != 0)
        {
            printf("\nThread cannot be created : [%s]", strerror(error));
            exit(EXIT_FAILURE);
        }
        i++;
    }

    i = 0;
    while (i < NUM_THREADS)
    {
        error = pthread_join(tid[i], &status);
        if (error)
        {
            printf("ERROR: return code from pthread_join() is %d\n", error);
            exit(EXIT_FAILURE);
        }
        i++;
    }

    cout << "Var1: " << var1 << "\tVar2: " << var2 << "\n";
    // assert(var1 == N * NUM_THREADS && var2 == 1);
    cout << "Spin lock: Time taken (us): " << sync_time << "\n";

    // Ticket lock
    var1 = 0;
    var2 = (N * NUM_THREADS + 1);
    sync_time.store(0);

    lock_obj = new TicketLock();
    i = 0;
    while (i < NUM_THREADS)
    {
        args[i].m_id = i;
        args[i].m_lock = lock_obj;

        error = pthread_create(&tid[i], &attr, thrBody, (void *)(args + i));
        if (error != 0)
        {
            printf("\nThread cannot be created : [%s]", strerror(error));
            exit(EXIT_FAILURE);
        }
        i++;
    }

    i = 0;
    while (i < NUM_THREADS)
    {
        error = pthread_join(tid[i], &status);
        if (error)
        {
            printf("ERROR: return code from pthread_join() is %d\n", error);
            exit(EXIT_FAILURE);
        }
        i++;
    }

    cout << "Var1: " << var1 << "\tVar2: " << var2 << "\n";
    // assert(var1 == N * NUM_THREADS && var2 == 1);
    cout << "Ticket lock: Time taken (us): " << sync_time << "\n";
    // Array Q lock
    var1 = 0;
    var2 = (N * NUM_THREADS + 1);
    sync_time.store(0);
    lock_obj = new ArrayQLock();
    i = 0;
    while (i < NUM_THREADS)
    {
        args[i].m_id = i;
        args[i].m_lock = lock_obj;

        error = pthread_create(&tid[i], &attr, thrBody, (void *)(args + i));
        if (error != 0)
        {
            printf("\nThread cannot be created : [%s]", strerror(error));
            exit(EXIT_FAILURE);
        }
        i++;
    }

    i = 0;
    while (i < NUM_THREADS)
    {
        error = pthread_join(tid[i], &status);
        if (error)
        {
            printf("ERROR: return code from pthread_join() is %d\n", error);
            exit(EXIT_FAILURE);
        }
        i++;
    }

    cout << "Var1: " << var1 << "\tVar2: " << var2 << "\n";
    // assert(var1 == N * NUM_THREADS && var2 == 1);
    cout << "Array Q lock: Time taken (us): " << sync_time << "\n";

    pthread_barrier_destroy(&g_barrier);
    pthread_attr_destroy(&attr);

    pthread_exit(NULL);
}
