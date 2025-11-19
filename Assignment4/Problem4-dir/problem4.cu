#include <cstdlib>
#include <cuda.h>
#include <iostream>
#include <numeric>
#include <sys/time.h>
#include <random>
#include <cmath>
#include <algorithm>
#define THRESHOLD (std::numeric_limits<float>::epsilon())

using std::cerr;
using std::cout;
using std::endl;
using namespace std;
#define cudaCheckError(ans)               \
  {                                       \
    gpuAssert((ans), __FILE__, __LINE__); \
  }

const int block_size_x_2d = 16;
const int block_size_y_2d = 16;
const int block_size_z_3d = 8;
const int block_size_y_3d = 8;
const int block_size_x_3d = 8;
inline void gpuAssert(cudaError_t code, const char *file, int line,
                      bool abort = true)
{
  if (code != cudaSuccess)
  {
    fprintf(stderr, "GPUassert: %s %s %d\n", cudaGetErrorString(code), file,
            line);
    if (abort)
      exit(code);
  }
}

const uint64_t N = (1 << 4);
const uint64_t filter_size = 3;
__constant__ float d_filter[filter_size * filter_size];
__constant__ float d_filter_3d[filter_size * filter_size * filter_size];
__host__ void conv2D(const float *input, float *output, const float *filter)
{
  for (uint64_t i = 0; i < N; i++)
  {
    for (uint64_t j = 0; j < N; j++)
    {
      float sum = 0.0f;
      for (uint64_t fi = 0; fi < filter_size; fi++)
      {
        for (uint64_t fj = 0; fj < filter_size; fj++)
        {
          int64_t in_i = i + fi - filter_size / 2;
          int64_t in_j = j + fj - filter_size / 2;
          if (in_i >= 0 && in_i < N && in_j >= 0 && in_j < N)
          {
            sum += input[in_i * N + in_j] * filter[fi * filter_size + fj];
          }
        }
      }
      output[i * N + j] = sum;
    }
  }
}
__host__ void conv3D(const float *input, float *output, const float *filter)
{
  for (uint64_t i = 0; i < N; i++)
  {
    for (uint64_t j = 0; j < N; j++)
    {
      for (uint64_t k = 0; k < N; k++)
      {
        float sum = 0.0f;
        for (uint64_t fi = 0; fi < filter_size; fi++)
        {
          for (uint64_t fj = 0; fj < filter_size; fj++)
          {
            for (uint64_t fk = 0; fk < filter_size; fk++)
            {
              int64_t in_i = i + fi - filter_size / 2;
              int64_t in_j = j + fj - filter_size / 2;
              int64_t in_k = k + fk - filter_size / 2;
              if (in_i >= 0 && in_i < N && in_j >= 0 && in_j < N && in_k >= 0 && in_k < N)
              {
                sum += input[in_i * N * N + in_j * N + in_k] * filter[fi * filter_size * filter_size + fj * filter_size + fk];
              }
            }
          }
        }
        output[i * N * N + j * N + k] = sum;
      }
    }
  }
}

__global__ void kernel_2D_basic(float *input, float *output, float *filter)
{
  // Calculate global thread coordinates
  int row = blockIdx.y * blockDim.y + threadIdx.y;
  int col = blockIdx.x * blockDim.x + threadIdx.x;

  if (row < N && col < N)
  {
    float sum = 0.0f;
    // Apply the filter
    for (int fi = 0; fi < filter_size; fi++)
    {
      for (int fj = 0; fj < filter_size; fj++)
      {
        int in_row = row + fi - filter_size / 2;
        int in_col = col + fj - filter_size / 2;
        if (in_row >= 0 && in_row < N && in_col >= 0 && in_col < N)
        {
          sum += input[in_row * N + in_col] * filter[fi * filter_size + fj];
        }
      }
    }
    output[row * N + col] = sum;
  }
}
// TODO: Edit the function definition as required
__global__ void kernel_2D_opt(float *input, float *output)
{
  int row = blockIdx.y * blockDim.y + threadIdx.y;
  int col = blockIdx.x * blockDim.x + threadIdx.x;
  if (row >= N || col >= N) return;

  __shared__ float shared_input[block_size_y_2d + filter_size - 1][block_size_x_2d + filter_size - 1];


  // Compute the starting global coordinates of this tile
  int tile_origin_row = blockIdx.y * blockDim.y - filter_size / 2;
  int tile_origin_col = blockIdx.x * blockDim.x - filter_size / 2;

  // Load the shared input tile cooperatively
  for (int i = threadIdx.y; i < block_size_y_2d + filter_size - 1; i += blockDim.y)
  {
    for (int j = threadIdx.x; j < block_size_x_2d + filter_size - 1; j += blockDim.x)
    {
      int in_row = tile_origin_row + i;
      int in_col = tile_origin_col + j;

      if (in_row >= 0 && in_row < N && in_col >= 0 && in_col < N)
        shared_input[i][j] = input[in_row * N + in_col];
      else
        shared_input[i][j] = 0.0f;
    }
  }
  __syncthreads();

  // Convolution
  float sum = 0.0f;
  for (int fi = 0; fi < filter_size; fi++)
    for (int fj = 0; fj < filter_size; fj++)
      sum += shared_input[threadIdx.y + fi][threadIdx.x + fj] *d_filter[fi * filter_size + fj];

  output[row * N + col] = sum;
}

// TODO: Edit the function definition as required
__global__ void kernel_3D_basic(float *input, float *output, float *filter)
{
  int row = blockIdx.y * blockDim.y + threadIdx.y;
  int col = blockIdx.x * blockDim.x + threadIdx.x;
  int depth = blockIdx.z * blockDim.z + threadIdx.z;
  if (row < N && col < N && depth < N)
  {
    float sum = 0.0f;
    // Apply the filter
    for (int fk = 0; fk < filter_size; fk++)
    {
      int in_depth = depth + fk - filter_size / 2;
      for (int fj = 0; fj < filter_size; fj++)
      {
        int in_row = row + fj - filter_size / 2;
        for (int fi = 0; fi < filter_size; fi++)
        {
          
          int in_col = col + fi - filter_size / 2;
          
          if (in_row >= 0 && in_row < N && in_col >= 0 && in_col < N &&
              in_depth >= 0 && in_depth < N)
          {
            sum += input[in_depth*N*N+in_row * N + in_col] *
                   filter[fk * filter_size * filter_size + fj * filter_size + fi];
          }
        }
      }
    }
    output[depth*N*N+row *N + col  ] = sum;
  }
}

__global__ void kernel_3D_opt(const float *__restrict__ input,
                              float *__restrict__ output)
{
  // Compute global coordinates
  const int y = blockIdx.y * blockDim.y + threadIdx.y; // row
  const int x = blockIdx.x * blockDim.x + threadIdx.x; // col
  const int z = blockIdx.z * blockDim.z + threadIdx.z; // depth

  // Guard threads outside global bounds
  if (y >= N || x >= N || z >= N)
    return;

  const int f = filter_size;

  // Shared tile for input
  __shared__ float shared_input
      [block_size_z_3d + filter_size - 1]
      [block_size_y_3d + filter_size - 1]
      [block_size_x_3d + filter_size - 1];

  // Compute the top-left-front corner of this tile in global space
  const int z0 = blockIdx.z * blockDim.z - f / 2;
  const int y0 = blockIdx.y * blockDim.y - f / 2;
  const int x0 = blockIdx.x * blockDim.x - f / 2;

  // Load shared tile cooperatively (coalesced + guarded)
  for (int kz = threadIdx.z; kz < blockDim.z + f - 1; kz += blockDim.z)
  {
    for (int ky = threadIdx.y; ky < blockDim.y + f - 1; ky += blockDim.y)
    {
      for (int kx = threadIdx.x; kx < blockDim.x + f - 1; kx += blockDim.x)
      {
        int gz = z0 + kz;
        int gy = y0 + ky;
        int gx = x0 + kx;

        if (gz >= 0 && gz < N && gy >= 0 && gy < N && gx >= 0 && gx < N)
          shared_input[kz][ky][kx] = input[gz * N * N + gy * N + gx];
        else
          shared_input[kz][ky][kx] = 0.0f;
      }
    }
  }

  __syncthreads();

  // Convolution (correlation form)
  float sum = 0.0f;
  for (int fk = 0; fk < f; ++fk)
  {
    for (int fj = 0; fj < f; ++fj)
    {
      for (int fi = 0; fi < f; ++fi)
      {
        float v = shared_input[threadIdx.z + fk]
                                 [threadIdx.y + fj]
                                 [threadIdx.x + fi];
        float w = d_filter_3d[fk * f * f + fj * f + fi];
        sum += v * w;
      }
    }
  }

  output[z * N * N + y * N + x] = sum;
}

__host__ void check_result_2d(const float *w_ref, const float *w_opt)
{
  double maxdiff = 0.0;
  int numdiffs = 0;

  for (uint64_t i = 0; i < N; i++)
  {
    for (uint64_t j = 0; j < N; j++)
    {
      double this_diff =
          w_ref[i * N + j] - w_opt[i * N + j];
      if (std::fabs(this_diff) > THRESHOLD)
      {
        numdiffs++;
        if (this_diff > maxdiff)
        {
          maxdiff = this_diff;
        }
      }
    }
  }

  if (numdiffs > 0)
  {
    cout << numdiffs << " Diffs found over THRESHOLD " << THRESHOLD
         << "; Max Diff = " << maxdiff << endl;
  }
  else
  {
    cout << "No differences found between base and test versions\n";
  }
}
__host__ void check_result(const float *w_ref, const float *w_opt)
{
  double maxdiff = 0.0;
  int numdiffs = 0;

  for (uint64_t i = 0; i < N; i++)
  {
    for (uint64_t j = 0; j < N; j++)
    {
      for (uint64_t k = 0; k < N; k++)
      {
        double this_diff =
            w_ref[i + N * j + N * N * k] - w_opt[i + N * j + N * N * k];
        if (std::fabs(this_diff) > THRESHOLD)
        {
          numdiffs++;
          if (this_diff > maxdiff)
          {
            maxdiff = this_diff;
          }
        }
      }
    }
  }

  if (numdiffs > 0)
  {
    cout << numdiffs << " Diffs found over THRESHOLD " << THRESHOLD
         << "; Max Diff = " << maxdiff << endl;
  }
  else
  {
    cout << "No differences found between base and test versions\n";
  }
}

void print2D(const float *A)
{
  for (int i = 0; i < N; ++i)
  {
    for (int j = 0; j < N; ++j)
    {
      cout << A[i * N + j] << "\t";
    }
    cout << "n";
  }
}

void print3D(const float *A)
{
  for (int i = 0; i < N; ++i)
  {
    for (int j = 0; j < N; ++j)
    {
      for (int k = 0; k < N; ++k)
      {
        cout << A[i * N * N + j * N + k] << "\t";
      }
      cout << "n";
    }
    cout << "n";
  }
}

double rtclock()
{ // Seconds
  struct timezone Tzp;
  struct timeval Tp;
  int stat;
  stat = gettimeofday(&Tp, &Tzp);
  if (stat != 0)
  {
    cout << "Error return from gettimeofday: " << stat << "\n";
  }
  return (Tp.tv_sec + Tp.tv_usec * 1.0e-6);
}

int main()
{
  // TODO: Invoke kernel2D_basic()
  // TODO: Adapt check_result()
  std::mt19937 gen(42); // Standard mersenne_twister_engine seeded with 42
  std::uniform_real_distribution<float> dis(0.0, 1.0);
  float *input2D = new float[N * N];
  float *output2D = new float[N * N];
  float *filter2D = new float[filter_size * filter_size];
  float *d_input2D;
  float *d_output2D;
  float *d_filter2D;

  int block_x_2d = (N + block_size_x_2d - 1) / block_size_x_2d;
  int block_y_2d = (N + block_size_y_2d - 1) / block_size_y_2d;
  int block_x_3d = (N + block_size_x_3d - 1) / block_size_x_3d;
  int block_y_3d = (N + block_size_y_3d - 1) / block_size_y_3d;
  int block_z_3d = (N + block_size_z_3d - 1) / block_size_z_3d;
  std::generate_n(input2D, N * N, [&]()
                  { return dis(gen); });
  fill_n(output2D, N * N, 0.0f);
  fill_n(filter2D, filter_size * filter_size, 1.0f / (filter_size * filter_size));
  conv2D(input2D, output2D, filter2D);
  cudaCheckError(cudaMalloc((void **)&d_input2D, N * N * sizeof(float)));
  cudaCheckError(cudaMalloc((void **)&d_output2D, N * N * sizeof(float)));
  cudaCheckError(cudaMalloc((void **)&d_filter2D, filter_size * filter_size * sizeof(float)));
  cudaCheckError(cudaMemcpy(d_input2D, input2D, N * N * sizeof(float), cudaMemcpyHostToDevice));
  cudaCheckError(cudaMemcpy(d_filter2D, filter2D, filter_size * filter_size * sizeof(float), cudaMemcpyHostToDevice));
  cudaCheckError(cudaMemcpyToSymbol(d_filter, filter2D, filter_size * filter_size * sizeof(float)));
  //
  cudaEvent_t start, stop;
  cudaEventCreate(&start);
  cudaEventCreate(&stop);
  float kernel_time = 0.0f;
  kernel_2D_basic<<<dim3(block_x_2d, block_y_2d), dim3(block_size_x_2d, block_size_y_2d)>>>(d_input2D, d_output2D, d_filter2D);
  cudaEventRecord(start);
  for (int i = 0; i < 100; i++)
    kernel_2D_basic<<<dim3(block_x_2d, block_y_2d), dim3(block_size_x_2d, block_size_y_2d)>>>(d_input2D, d_output2D, d_filter2D);
  cudaEventRecord(stop);
  cudaEventSynchronize(stop);
  cudaEventElapsedTime(&kernel_time, start, stop);
  float output2D_kernel[N * N];
  cudaCheckError(cudaMemcpy(output2D_kernel, d_output2D, N * N * sizeof(float), cudaMemcpyDeviceToHost));
  check_result_2d(output2D, output2D_kernel);
  cout << "Kernel2D_basic time (ms): " << kernel_time / 100 << "\n";

  cudaMemset(d_output2D, 0, N * N * sizeof(float));
  kernel_2D_opt<<<dim3(block_x_2d, block_y_2d), dim3(block_size_x_2d, block_size_y_2d)>>>(d_input2D, d_output2D);
  cudaEventRecord(start);
  for (int i = 0; i < 100; i++)
    kernel_2D_opt<<<dim3(block_x_2d, block_y_2d), dim3(block_size_x_2d, block_size_y_2d)>>>(d_input2D, d_output2D);
  cudaEventRecord(stop);
  cudaEventSynchronize(stop);
  cudaEventElapsedTime(&kernel_time, start, stop);
  cudaCheckError(cudaMemcpy(output2D_kernel, d_output2D, N * N * sizeof(float), cudaMemcpyDeviceToHost));
  check_result_2d(output2D, output2D_kernel);
  cudaFree(d_input2D);
  cudaFree(d_output2D);
  cudaFree(d_filter2D);
  // TODO: Invoke kernel2D_opt()
  // TODO: Adapt check_result()
  cout << "kernel2D_opt time (ms): " << kernel_time / 100 << "\n";
  delete[] input2D;
  delete[] output2D;
  delete[] filter2D;
  // TODO: Invoke kernel3D_basic()
  // TODO: Adapt check_result()
  float *input3D = new float[N * N * N];
  float *output3D = new float[N * N * N];
  float *filter3D = new float[filter_size * filter_size * filter_size];
  float *d_input3D;
  float *d_output3D;
  float *d_filter3D;
  cudaCheckError(cudaMalloc((void **)&d_input3D, N * N * N * sizeof(float)));
  cudaCheckError(cudaMalloc((void **)&d_output3D, N * N * N * sizeof(float)));
  cudaCheckError(cudaMalloc((void **)&d_filter3D, filter_size * filter_size * filter_size * sizeof(float)));
  std::generate_n(input3D, N * N * N, [&]()
                  { return dis(gen); });
  fill_n(output3D, N * N * N, 0.0f);
  fill_n(filter3D, filter_size * filter_size * filter_size, 1.0f / (filter_size * filter_size * filter_size));
  conv3D(input3D, output3D, filter3D);
  cudaCheckError(cudaMemcpy(d_input3D, input3D, N * N * N * sizeof(float), cudaMemcpyHostToDevice));
  cudaCheckError(cudaMemcpy(d_filter3D, filter3D, filter_size * filter_size * filter_size * sizeof(float), cudaMemcpyHostToDevice));
  cudaCheckError(cudaMemcpyToSymbol(d_filter_3d, filter3D, filter_size * filter_size * filter_size * sizeof(float)));
  kernel_3D_basic<<<dim3(block_x_3d, block_y_3d, block_z_3d), dim3(block_size_x_3d, block_size_y_3d, block_size_z_3d)>>>(d_input3D, d_output3D, d_filter3D);
  cudaEventRecord(start);
  for (int i = 0; i < 100; i++)
    kernel_3D_basic<<<dim3(block_x_3d, block_y_3d, block_z_3d), dim3(block_size_x_3d, block_size_y_3d, block_size_z_3d)>>>(d_input3D, d_output3D, d_filter3D);
  cudaEventRecord(stop);
  cudaEventSynchronize(stop);
  cudaEventElapsedTime(&kernel_time, start, stop);
  float *output3D_kernel = new float[N * N * N];
  cudaCheckError(cudaMemcpy(output3D_kernel, d_output3D, N * N * N * sizeof(float), cudaMemcpyDeviceToHost));
  check_result(output3D, output3D_kernel);
  cout << "Kernel3D_basic time (ms): " << kernel_time / 100 << "\n";
  cudaMemset(d_output3D, 0, N * N * N * sizeof(float));
  kernel_3D_opt<<<dim3(block_x_3d, block_y_3d, block_z_3d), dim3(block_size_x_3d, block_size_y_3d, block_size_z_3d)>>>(d_input3D, d_output3D);
  cudaEventRecord(start);
  for (int i = 0; i < 100; i++)
    kernel_3D_opt<<<dim3(block_x_3d, block_y_3d, block_z_3d), dim3(block_size_x_3d, block_size_y_3d, block_size_z_3d)>>>(d_input3D, d_output3D);
  cudaEventRecord(stop);
  cudaEventSynchronize(stop);
  cudaEventElapsedTime(&kernel_time, start, stop);
  cudaCheckError(cudaMemcpy(output3D_kernel, d_output3D, N * N * N * sizeof(float), cudaMemcpyDeviceToHost));
  check_result(output3D, output3D_kernel);

  // TODO: Invoke kernel3D_opt()
  // TODO: Adapt check_result()
  cout << "Kernel3D_opt time (ms): " << kernel_time / 100 << "\n";

  delete[] input3D;
  delete[] output3D;
  delete[] filter3D;
  delete[] output3D_kernel;
  cudaFree(d_input3D);
  cudaFree(d_output3D);
  cudaFree(d_filter3D);
  cudaEventDestroy(start);
  cudaEventDestroy(stop);
  // TODO: Free memory

  return EXIT_SUCCESS;
}
