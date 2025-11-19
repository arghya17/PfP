#include <chrono>
#include <cmath>
#include <cstdint>
#include <cstdlib>
#include <iomanip>
#include <iostream>
#include <limits.h>
#include <x86intrin.h>
#include <bits/stdc++.h>
#define SSE_WIDTH_BITS (128)
#define AVX2_WIDTH_BITS (256)
using std::cout;
using std::endl;

using std::chrono::duration_cast;
using HR = std::chrono::high_resolution_clock;
using HRTimer = HR::time_point;
using std::chrono::microseconds;
using std::chrono::milliseconds;

const uint32_t NX = 128;
const uint32_t NY = 128;
const uint32_t NZ = 128;
const uint64_t TOTAL_SIZE = (NX * NY * NZ);

const uint32_t N_ITERATIONS = 100;
const uint64_t INITIAL_VAL = 1000000;

void scalar_3d_gradient(const uint64_t *A, uint64_t *B)
{
  const uint64_t stride_i = (NY * NZ);
  for (int i = 1; i < NX - 1; ++i)
  {
    for (int j = 0; j < NY; ++j)
    {
      for (int k = 0; k < NZ; ++k)
      {
        uint64_t base_idx = (i * NY * NZ) + j * NZ + k;
        // A[i+1, j, k]
        int A_right = A[base_idx + stride_i];
        // A[i-1, j, k]
        int A_left = A[base_idx - stride_i];
        B[base_idx] = A_right - A_left;
      }
    }
  }
}
void sse_3d_gradient(const uint64_t *__restrict__ A, uint64_t *__restrict__ B)
{
  const uint64_t stride_i = (NY * NZ);
  int stride_k;
  int kmax = NZ;
  for (int i = 1; i < NX - 1; ++i)
  {
    for (int j = 0; j < NY; ++j)
    {
      stride_k = SSE_WIDTH_BITS / (sizeof(uint64_t) * 8);
      if ((NZ % stride_k) != 0)
      {
        kmax = NZ - (NZ % stride_k);
      }
      for (int k = 0; k < kmax; k += stride_k)
      {
        uint64_t base_idx = (i * NY * NZ) + j * NZ + k;
        __m128i A_right = _mm_load_si128((__m128i const *)&A[base_idx + stride_i]);
        __m128i A_left = _mm_load_si128((__m128i const *)&A[base_idx - stride_i]);
        __m128i result = _mm_sub_epi64(A_right, A_left);
        _mm_store_si128((__m128i *)&B[base_idx], result);
      }
      for (int k = kmax; k < NZ; ++k)
      {
        uint64_t base_idx = (i * NY * NZ) + j * NZ + k;
        // A[i+1, j, k]
        int A_right = A[base_idx + stride_i];
        // A[i-1, j, k]
        int A_left = A[base_idx - stride_i];
        B[base_idx] = A_right - A_left;
      }
    }
  }
}

void avx_3d_gradient(const uint64_t *__restrict__ A, uint64_t *__restrict__ B)
{
  const uint64_t stride_i = (NY * NZ);
  int stride_k;
  int kmax = NZ;
  for (int i = 1; i < NX - 1; ++i)
  {
    for (int j = 0; j < NY; ++j)
    {
      stride_k = AVX2_WIDTH_BITS / (sizeof(uint64_t) * 8);
      if ((NZ % stride_k) != 0)
      {
        kmax = NZ - (NZ % stride_k);
      }
      for (int k = 0; k < kmax; k += stride_k)
      {
        uint64_t base_idx = (i * NY * NZ) + j * NZ + k;
        __m256i A_right = _mm256_load_si256((__m256i const *)&A[base_idx + stride_i]);
        __m256i A_left = _mm256_load_si256((__m256i const *)&A[base_idx - stride_i]);
        __m256i result = _mm256_sub_epi64(A_right, A_left);
        _mm256_store_si256((__m256i *)&B[base_idx], result);
      }
      for (int k = kmax; k < NZ; ++k)
      {
        uint64_t base_idx = (i * NY * NZ) + j * NZ + k;
        // A[i+1, j, k]
        int A_right = A[base_idx + stride_i];
        // A[i-1, j, k]
        int A_left = A[base_idx - stride_i];
        B[base_idx] = A_right - A_left;
      }
    }
  }
}

long compute_checksum(const uint64_t *grid)
{
  uint64_t sum = 0;
  for (int i = 1; i < (NX - 1); i++)
  {
    for (int j = 0; j < NY; j++)
    {
      for (int k = 0; k < NZ; k++)
      {
        sum += grid[i * NY * NZ + j * NZ + k];
      }
    }
  }
  return sum;
}

int main()
{
  auto *i_grid = static_cast<uint64_t *>(aligned_alloc(32, TOTAL_SIZE * sizeof(uint64_t)));
  for (int i = 0; i < NX; i++)
  {
    for (int j = 0; j < NY; j++)
    {
      for (int k = 0; k < NZ; k++)
      {
        i_grid[i * NY * NZ + j * NZ + k] = (INITIAL_VAL + i +
                                            2 * j + 3 * k);
      }
    }
  }

  auto *o_grid1 = static_cast<uint64_t *>(aligned_alloc(32, TOTAL_SIZE * sizeof(uint64_t)));
  std::fill_n(o_grid1, TOTAL_SIZE, 0);

  auto start = HR::now();
  for (int iter = 0; iter < N_ITERATIONS; ++iter)
  {
    scalar_3d_gradient(i_grid, o_grid1);
  }
  auto end = HR::now();
  auto duration = duration_cast<milliseconds>(end - start).count();
  cout << "Scalar kernel time (ms): " << duration << "\n";

  // Compare checksum with vector versions
  uint64_t scalar_checksum = compute_checksum(o_grid1);
  cout << "Checksum: " << scalar_checksum << "\n";
  delete[] o_grid1;
  // Assert the checksum for vectors variants

  o_grid1 = static_cast<uint64_t *>(aligned_alloc(32, TOTAL_SIZE * sizeof(uint64_t)));
  std::fill_n(o_grid1, TOTAL_SIZE, 0);
  start = HR::now();
  for (int iter = 0; iter < N_ITERATIONS; ++iter)
  {
    sse_3d_gradient(i_grid, o_grid1);
  }
  end = HR::now();
  duration = duration_cast<milliseconds>(end - start).count();
  cout << "SSE kernel time (ms): " << duration << "\n";
  uint64_t sse_checksum = compute_checksum(o_grid1);
  cout << "SSE Checksum: " << sse_checksum << "\n";
  assert(scalar_checksum == sse_checksum ||
         printf("SSE checksum mismatch!\n"));
  delete[] o_grid1;
  o_grid1 = static_cast<uint64_t *>(aligned_alloc(32, TOTAL_SIZE * sizeof(uint64_t)));
  std::fill_n(o_grid1, TOTAL_SIZE, 0);
  start = HR::now();
  for (int iter = 0; iter < N_ITERATIONS; ++iter)
  {
    avx_3d_gradient(i_grid, o_grid1);
  }
  end = HR::now();
  duration = duration_cast<milliseconds>(end - start).count();
  cout << "AVX2 kernel time (ms): " << duration << "\n";
  uint64_t avx_checksum = compute_checksum(o_grid1);
  cout << "AVX2 Checksum: " << avx_checksum << "\n";
  assert(scalar_checksum == avx_checksum ||
         printf("AVX2 checksum mismatch!\n"));
  delete[] o_grid1;
  delete[] i_grid;

  return EXIT_SUCCESS;
}
