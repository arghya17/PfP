#include <iostream>
#include <random>
#include <chrono>
#include <papi.h>    // <-- this is the required header
#include <algorithm> // for std::min

using namespace std;

// Fill matrix with random numbers
void fill_matrix(double *mat, int n)
{
    random_device rd;
    mt19937 gen(rd());
    uniform_real_distribution<> dis(0.0, 1.0);
    for (int i = 0; i < n * n; ++i)
        mat[i] = dis(gen);
}

// Normal matrix multiplication
void matmul_normal(const double *A, const double *B, double *C, int n)
{
    for (int i = 0; i < n; ++i)
        for (int j = 0; j < n; ++j)
            for (int k = 0; k < n; ++k)
                C[i * n + j] += A[i * n + k] * B[k * n + j];
}

// Blocked matrix multiplication
void matmul_blocked(const double *A, const double *B, double *C, int n, int block_size)
{
    for (int ii = 0; ii < n; ii += block_size)
        for (int jj = 0; jj < n; jj += block_size)
            for (int kk = 0; kk < n; kk += block_size)
                for (int i = ii; i < min(ii + block_size, n); ++i)
                    for (int j = jj; j < min(jj + block_size, n); ++j)
                        for (int k = kk; k < min(kk + block_size, n); ++k)
                            C[i * n + j] += A[i * n + k] * B[k * n + j];
}

// Measure time and PAPI events
void measure(const char *label,
             void (*matmul)(const double *, const double *, double *, int, int),
             const double *A, const double *B, double *C, int n, int block_size)
{
    if (PAPI_library_init(PAPI_VER_CURRENT) != PAPI_VER_CURRENT)
    {
        std::cerr << "PAPI init error!" << std::endl;
        return;
    }

    long long values[2];
    int events[2] = {PAPI_L1_DCM, PAPI_L2_DCM};
    int EventSet = PAPI_NULL;
    if (PAPI_create_eventset(&EventSet) != PAPI_OK)
    {
        std::cerr << "Error creating event set!" << std::endl;
        return;
    }

    if (PAPI_add_event(EventSet, PAPI_L1_DCM) != PAPI_OK)
    { // L1 Data Cache Misses
        std::cerr << "Error adding PAPI_L1_DCM" << std::endl;
        return;
    }
    if (PAPI_add_event(EventSet, PAPI_L2_DCM) != PAPI_OK)
    { // L1 Data Cache Misses
        std::cerr << "Error adding PAPI_L2_DCM" << std::endl;
        return;
    }
    if (PAPI_start(EventSet) != PAPI_OK)
    {
        std::cerr << "PAPI_start error!" << std::endl;
        return;
    }
    auto start = chrono::high_resolution_clock::now();
    matmul(A, B, C, n, block_size);
    auto end = chrono::high_resolution_clock::now();

    if (PAPI_stop(EventSet, values) != PAPI_OK)
    {
        std::cerr << "PAPI_stop error!" << std::endl;
        return;
    }
    chrono::duration<double> elapsed = end - start;
    cout << label << ":\n";
    cout << "Time: " << elapsed.count() << " seconds\n";
    cout << "L1 DCM: " << values[0] << "\n";
    cout << "L2 DCM: " << values[1] << "\n\n";
}

int main(int argc, char *argv[])
{
    if (argc < 3)
    {
        cout << "Usage: " << argv[0] << " <matrix_size> <block_size>\n";
        return 1;
    }
    int n = atoi(argv[1]);
    int block_size = atoi(argv[2]);

    double *A = new double[n * n];
    double *B = new double[n * n];
    double *C = new double[n * n]();
    double *D = new double[n * n]();

    fill_matrix(A, n);
    fill_matrix(B, n);

    if (PAPI_library_init(PAPI_VER_CURRENT) != PAPI_VER_CURRENT)
    {
        cerr << "PAPI_library_init error\n";
        delete[] A;
        delete[] B;
        delete[] C;
        delete[] D;
        return 1;
    }

    // Normal multiplication
    measure("Normal Matrix Multiplication", [](const double *A, const double *B, double *C, int n, int)
            { matmul_normal(A, B, C, n); }, A, B, C, n, block_size);

    // Blocked multiplication
    measure("Blocked Matrix Multiplication", [](const double *A, const double *B, double *C, int n, int block_size)
            { matmul_blocked(A, B, C, n, block_size); }, A, B, D, n, block_size);

    PAPI_shutdown();
    delete[] A;
    delete[] B;
    delete[] C;
    delete[] D;
    return 0;
}
