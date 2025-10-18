#include <bits/stdc++.h>
#include <papi.h>
using std::cerr;
using std::cout;
using std::endl;
using std::uint8_t, std::uint16_t, std::uint32_t, std::uint64_t;

#define INP_H (1 << 6)
#define INP_W (1 << 6)
#define INP_D (1 << 6)
#define FIL_H (3)
#define FIL_W (3)
#define FIL_D (3)
using namespace std;
std::ofstream outfile("problem1-dir/results.txt", std::ios::app);
class Timer
{
    using Clock = chrono::high_resolution_clock;
    using TimePoint = chrono::time_point<Clock>;
    TimePoint start_time;
    string task_name;

public:
    Timer(const string &name) : task_name(name), start_time(Clock::now()) {}
    ~Timer()
    {
        auto end_time = Clock::now();
        auto duration = chrono::duration_cast<chrono::microseconds>(end_time - start_time);
        cout << task_name << " took " << duration.count() << " microseconds" << endl;
        outfile << duration.count() << "\t";
    }
};
class Array3D
{
    int x, y, z;
    int64_t *data;

public:
    Array3D(int x, int y, int z) : x(x), y(y), z(z)
    {
        data = new int64_t[x * y * z];
        memset(data, 0, sizeof(int64_t) * x * y * z);
    }
    int64_t &operator()(int i, int j, int k)
    {
        return data[i * (y * z) + j * z + k];
    }
};

void cc_3d_no_padding(const uint64_t *input,
                      const uint64_t (*kernel)[FIL_W][FIL_D], uint64_t *result,
                      const uint64_t outputHeight, const uint64_t outputWidth,
                      const uint64_t outputDepth)
{
    for (uint64_t i = 0; i < outputHeight; i++)
    {
        for (uint64_t j = 0; j < outputWidth; j++)
        {
            for (uint64_t k = 0; k < outputDepth; k++)
            {
                uint64_t sum = 0;
                for (uint64_t ki = 0; ki < FIL_H; ki++)
                {
                    for (uint64_t kj = 0; kj < FIL_W; kj++)
                    {
                        for (uint64_t kk = 0; kk < FIL_D; kk++)
                        {
                            sum += input[(i + ki) * INP_W * INP_D + (j + kj) * INP_D +
                                         (k + kk)] *
                                   kernel[ki][kj][kk];
                        }
                    }
                }
                result[i * outputWidth * outputDepth + j * outputDepth + k] += sum;
            }
        }
    }
}

void cc_3d_no_padding_blocked(const uint64_t *input,
                              const uint64_t (*kernel)[FIL_W][FIL_D], uint64_t *result,
                              const uint64_t outputHeight, const uint64_t outputWidth,
                              const uint64_t outputDepth,
                              const int B1, const int B2, const int B3)
{
    for (uint64_t i = 0; i < outputHeight; i = i + B1)
    {
        const uint64_t i_end = min(i + B1, outputHeight);
        for (uint64_t j = 0; j < outputWidth; j = j + B2)
        {
            const uint64_t j_end = min(j + B2, outputWidth);
            for (uint64_t k = 0; k < outputDepth; k = k + B3)
            {
                const uint64_t k_end = min(k + B3, outputDepth);
                for (uint64_t i1 = i; i1 < i_end; i1++)
                {
                    for (uint64_t j1 = j; j1 < j_end; j1++)
                    {
                        for (uint64_t k1 = k; k1 < k_end; k1++)
                        {
                            uint64_t sum = 0;
                            for (uint64_t ki = 0; ki < FIL_H; ki++)
                            {
                                const uint64_t i_in = (i1 + ki) * INP_W * INP_D;
                                for (uint64_t kj = 0; kj < FIL_W; kj++)
                                {
                                    const uint64_t j_in = (j1 + kj) * INP_D;
                                    for (uint64_t kk = 0; kk < FIL_D; kk++)
                                    {
                                        sum += input[i_in + j_in + (k1 + kk)] * kernel[ki][kj][kk];
                                    }
                                }
                            }
                            result[i1 * outputWidth * outputDepth + j1 * outputDepth + k1] += sum;
                        }
                    }
                }
            }
        }
    }
}

int main(int argc, char *argv[])
{
    if (argc != 4)
    {
        cout << "Usage: " << argv[0] << " <I block size> <J block size> <K block size>" << endl;
        return 1;
    }
    int B1 = stoi(argv[1]);
    int B2 = stoi(argv[2]);
    int B3 = stoi(argv[3]);
    outfile << B1 << "\t" << B2 << "\t" << B3 << "\t";
    // using heaps to avoid stack overflow/segfault for large N
    uint64_t *input = new uint64_t[INP_H * INP_W * INP_D];
    std::fill_n(input, INP_H * INP_W * INP_D, 1);

    uint64_t filter[FIL_H][FIL_W][FIL_D] = {{{2, 1, 3}, {2, 1, 3}, {2, 1, 3}},
                                            {{2, 1, 3}, {2, 1, 3}, {2, 1, 3}},
                                            {{2, 1, 3}, {2, 1, 3}, {2, 1, 3}}};

    uint64_t outputHeight = INP_H - FIL_H + 1;
    uint64_t outputWidth = INP_W - FIL_W + 1;
    uint64_t outputDepth = INP_D - FIL_D + 1;

    auto *result = new uint64_t[outputHeight * outputWidth * outputDepth]{0};

    int u, v, w;
    int EventSet = PAPI_NULL;
    long long values[4];
    if (PAPI_library_init(PAPI_VER_CURRENT) != PAPI_VER_CURRENT)
    {
        std::cerr << "PAPI init error!" << std::endl;
        return 1;
    }

    if (PAPI_create_eventset(&EventSet) != PAPI_OK)
    {
        std::cerr << "Error creating event set!" << std::endl;
        return 1;
    }

    if (PAPI_add_event(EventSet, PAPI_L1_DCM) != PAPI_OK)
    { // L1 Data Cache Misses
        std::cerr << "Error adding PAPI_L1_DCM" << std::endl;
        return 1;
    }
    if (PAPI_add_event(EventSet, PAPI_L2_DCM) != PAPI_OK)
    { // L1 Data Cache Hits
        std::cerr << "Error adding PAPI_L1_DCH" << std::endl;
        return 1;
    }
    if (PAPI_add_event(EventSet, PAPI_L3_TCM) != PAPI_OK)
    { // L2 Data Cache Misses
        std::cerr << "Error adding PAPI_L3_TCM" << std::endl;
        return 1;
    }
    // normal convolution
    {
        if (PAPI_start(EventSet) != PAPI_OK)
        {
            std::cerr << "PAPI_start error!" << std::endl;
            return 1;
        }
        Timer t("Normal Convolution");
        cc_3d_no_padding(input, filter, result, outputHeight, outputWidth,
                         outputDepth);
        if (PAPI_stop(EventSet, values) != PAPI_OK)
        {
            std::cerr << "PAPI_stop error!" << std::endl;
            return 1;
        }

        cout << "L1 Data Cache Misses in Normal Convolution : " << values[0] << endl;
        cout << "L2 Data Cache Misses in Normal Convolution : " << values[1] << endl;
        cout << "L3 Total Cache Misses in Normal Convolution : " << values[2] << endl;
        outfile << values[0] << "\t" << values[1] << "\t";
        // std::cout << "L1 Data Cache Hits in Normal Convolution :   " << values[1] << std::endl;
    }
    delete[] input;
    input = new uint64_t[INP_H * INP_W * INP_D];
    std::fill_n(input, INP_H * INP_W * INP_D, 1);
    delete[] result;
    result = new uint64_t[outputHeight * outputWidth * outputDepth]{0};
    // blocked convolution
    {
        Timer t("Blocked Convolution");
        if (PAPI_start(EventSet) != PAPI_OK)
        {
            std::cerr << "PAPI_start error!" << std::endl;
            return 1;
        }
        cc_3d_no_padding_blocked(input, filter, result, outputHeight, outputWidth,
                                 outputDepth, B1, B2, B3);
        if (PAPI_stop(EventSet, values) != PAPI_OK)
        {
            std::cerr << "PAPI_stop error!" << std::endl;
            return 1;
        }
        cout << "L1 Data Cache Misses in blocked Convolution : " << values[0] << endl;
        cout << "L2 Data Cache Misses in blocked Convolution : " << values[1] << endl;
        cout << "L3 Total Cache Misses in blocked Convolution : " << values[2] << endl;
        outfile << values[0] << "\t" << values[1] << "\t";

        PAPI_shutdown();
    }
    outfile << std::endl;
    outfile.close();
    return 0;
}