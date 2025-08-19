#include <bits/stdc++.h>
using namespace std;
int counter = 0;
atomic<int> producers_alive{0};
mutex mtx_counter, mtx_buffer, mtx_write_complete, mtx_file_write, mtx_reader_active;
condition_variable cv_not_full, cv_not_empty, cv_writer, cv_reader;
unsigned int buffer_size = 0;
queue<int> lines_read;
bool writer_active = false;
bool reader_active = false;
void producer(int Lmin, int Lmax, int N, int buffer_size, const string &input_file, queue<string> &buffer)
{
    random_device rd;
    mt19937 gen(rd());
    uniform_int_distribution<> dis(Lmin, Lmax);
    int startline = 0;
    int endline = 0;
    while (counter < N)
    {
        int L = dis(gen);
        unique_lock<mutex> lock(mtx_counter);
        startline = counter;
        if (counter + L <= N)
        {
            counter += L;
            endline = startline + L;
            lock.unlock(); // pushing the number of lines read to the queue
        }
        else if (counter < N)
        {
            counter = N;
            endline = N;
            lock.unlock(); // pushing the remaining lines to the queue
        }
        else
        {
            lock.unlock();
            break;
        }
        // end of counter lock critical section

        unique_lock<mutex> write_lock(mtx_write_complete);
        cv_writer.wait(write_lock, []()
                       { return !writer_active; }); // wait until no writer is active
        writer_active = true;
        // write_lock to serialize the producer in the case L is more than M the buffer size and consumer wakes up the wrong
        //  producer thread to write to the buffer using mtx_buffer
        ifstream infile(input_file);
        vector<string> lines;
        string line;
        int line_count = 0;
        while (getline(infile, line))
        {
            line_count++;
            if (line_count <= startline)
                continue;
            else if (line_count > endline)
                break;

            lines.push_back(line);
        }
        // write complete mutex takes care of the case when the line size is more than the buffersize
        // so after reading from buffer other threads are not triggered when the current one is pending
        unique_lock<mutex> buffer_lock(mtx_buffer);
        lines_read.push(endline - startline);
        // buffer lock is used to wait for the buffer to be empty
        for (string l : lines)
        {
            cv_not_full.wait(buffer_lock, [&buffer, buffer_size]
                             { return buffer.size() < buffer_size; });
            buffer.push(l);
            cv_not_empty.notify_one(); // notify that buffer is not empty
        }
        buffer_lock.unlock();
        writer_active = false; // resetting the writer active flag
        cv_writer.notify_all();
        write_lock.unlock(); // unlocking the write lock on the thread so others can take the buffer
        // The write lock maintains the order of L write and
    }
    if (producers_alive.fetch_sub(1, memory_order_acq_rel) == 1)
    {
        // last producer notifies to wake consumers so they can exit if no data
        cv_not_empty.notify_all();
    }
    cout << "Producer thread finished producing lines from " << startline + 1 << " to " << endline << endl;
    cout << "Producers alive: " << producers_alive.load() << endl;
}
void consumer(queue<string> &buffer, const string &output_file)
{

    while (true)
    {
        unique_lock<mutex> reader_lock(mtx_reader_active);
        cv_reader.wait(reader_lock, []()
                       { return !reader_active; }); // wait until no reader is active
        reader_active = true;
        unique_lock<mutex> lock(mtx_buffer);
        cv_not_empty.wait(lock, [&buffer]
                          { return (!buffer.empty() && !lines_read.empty()) || (producers_alive.load() == 0 && buffer.empty() && lines_read.empty()); });
        if (producers_alive.load() == 0 && buffer.empty() && lines_read.empty())
        {
            reader_active = false;
            reader_lock.unlock();
            lock.unlock();
            break;
        }
        int lines = lines_read.front();
        lines_read.pop();
        vector<string> lines_to_write;
        for (int i = 0; i < lines; i++)
        {
            cv_not_empty.wait(lock, [&buffer]
                              { return !buffer.empty(); });
            cout << "Consumer thread is consuming " << lines << " lines" << endl;
            string line = buffer.front();
            buffer.pop();
            lines_to_write.push_back(line);
            cv_not_full.notify_one();
        }
        lock.unlock();
        reader_active = false; // resetting the reader active flag
        cv_reader.notify_all();
        reader_lock.unlock(); // unlocking the reader lock so that other threads can read from the buffer
        unique_lock<mutex> file_lock(mtx_file_write);
        ofstream outfile(output_file, ios::app);
        for (const string &l : lines_to_write)
        {
            outfile << l << endl;
        }
        outfile.close();
        file_lock.unlock();
    }
}
int main(int argc, char *argv[])
{
    if (argc != 7)
    {
        cout << "Usage: " << argv[0] << " <input_file> <num_threads> <Lmin> <Lmax> <buffer_size in lines> <output_file>\n";
        return 1;
    }

    string input_file = argv[1];
    int num_threads = stoi(argv[2]);
    int Lmin = stoi(argv[3]);
    int Lmax = stoi(argv[4]);
    int M = stoi(argv[5]);
    string output_file = argv[6];

    queue<string> buffer;
    buffer_size = M; // setting the global buffer size
    cout << filesystem::current_path() << endl;
    cout << "Input file: " << input_file << endl;
    cout << "Number of producer threads: " << num_threads << endl;
    cout << "Minimum lines per thread: " << Lmin << endl;
    cout << "Maximum lines per thread: " << Lmax << endl;
    cout << "Buffer size (lines): " << buffer_size << endl;
    cout << "Output file: " << output_file << endl;

    ifstream infile(input_file);
    int N = 0;
    string line;
    while (getline(infile, line))
    {
        N++;
    }
    cout << N << endl;
    if (filesystem ::remove(output_file) == 0)
    {
        cout << "Removed file " << output_file << endl;
    }
    else
    {
        cout << output_file << " not found" << endl;
    }
    producers_alive = num_threads;
    vector<thread> x;
    vector<thread> y;
    for (int i = 0; i < num_threads; i++)
    {
        thread producer_thread(producer, Lmin, Lmax, N, buffer_size, input_file, ref(buffer));
        x.push_back(move(producer_thread));
    }
    int consumer_threads = num_threads / 2;
    if (consumer_threads <= 0)
    {
        consumer_threads = 1;
    }
    for (int i = 0; i < consumer_threads; i++)
    {
        thread consumer_thread(consumer, ref(buffer), output_file);
        y.push_back(move(consumer_thread));
    }
    for (thread &i : x)
    {
        i.join();
    }
    for (thread &i : y)
    {
        i.join();
    }
    return 0;
}