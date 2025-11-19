#include <cassert>
#include <chrono>
#include <cstdlib>
#include <cuda.h>
#include <iostream>
#include <numeric>
#include <iterator>

using std::cerr;
using std::cout;
using std::endl;

using std::chrono::duration_cast;
using HR = std::chrono::high_resolution_clock;
using HRTimer = HR::time_point;
using std::chrono::microseconds;
using std::chrono::milliseconds;

// Size this based on the kernel you are executing
const uint64_t N = (1 << 30);
const uint64_t block_size = 768  ;
const uint64_t warp_size = 32;
#define WARP_SIZE 32
#define FULL_MASK 0xffffffff
#define cudaCheckError(ans)               \
  {                                       \
    gpuAssert((ans), __FILE__, __LINE__); \
  }
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
__global__ void cte_sum_intrablock(const uint32_t *arr, uint32_t *out, uint32_t *block_sums, int N)
{
  uint64_t i = blockIdx.x * blockDim.x + threadIdx.x;
  // trying to do prefix sum within each warp at first
  int laneId = threadIdx.x & 31;
  int warpId = threadIdx.x >> 5;
  __shared__ uint32_t shared[block_size]; // shared memory for each block
  if (i < N)
  {
    shared[threadIdx.x] = arr[i];
  }
  else
  {
    shared[threadIdx.x] = 0;
    return;
  }
  __syncwarp();
  for (int offset = 1; offset < warp_size; offset = offset * 2)
  {
    uint32_t val = 0;
    if (laneId >= offset)
    {
      val = shared[threadIdx.x - offset];
    }
    __syncwarp();
    shared[threadIdx.x] += val;
    __syncwarp();
  }
  __syncthreads();
  // now each warp has done its own prefix sum, we need to add the last elements of each warp to the next warps

  if (warpId == 0)
  {
    out[i] = shared[threadIdx.x];
    return;
  }
  for (int offset = 1; offset < blockDim.x / warp_size; offset = offset * 2)
  {
    uint32_t val = 0;
    if (warpId >= offset)
    {
      val = shared[(warpId - offset) * warp_size + warp_size - 1];
    }
    __syncthreads();
    shared[threadIdx.x] += val;
    __syncthreads();
  }
  if (block_sums && threadIdx.x == blockDim.x - 1)
  {
    int b = blockIdx.x;
    block_sums[b] = shared[blockDim.x - 1];
  }
  out[i] = shared[threadIdx.x];
}

__global__ void cte_sum_intrablock_fast(const uint32_t *arr, uint32_t *out, uint32_t *block_sums, int N)
{
  int i = blockIdx.x * blockDim.x + threadIdx.x;
  int tid = threadIdx.x;
  int lane = tid & (WARP_SIZE - 1); // thread index within warp
  int warpId = tid >> 5;            // warp index within block

  extern __shared__ uint32_t warp_sums[];
  uint32_t val = (i < N) ? arr[i] : 0;

  // Intra-warp prefix sum using shuffle
  // Inclusive scan inside each warp
  for (int offset = 1; offset < WARP_SIZE; offset <<= 1)
  {
    uint32_t n = __shfl_up_sync(FULL_MASK, val, offset);
    if (lane >= offset)
      val += n;
  }

  // Save warp totals
  if (lane == WARP_SIZE - 1)
    warp_sums[warpId] = val;

  __syncthreads();

  // Prefix sum of warp totals (done by warp 0) ----
  if (warpId == 0)
  {
    uint32_t warp_val = (lane < (blockDim.x / WARP_SIZE)) ? warp_sums[lane] : 0;

    for (int offset = 1; offset < WARP_SIZE; offset <<= 1)
    {
      uint32_t n = __shfl_up_sync(FULL_MASK, warp_val, offset);
      if (lane >= offset)
        warp_val += n;
    }

    warp_sums[lane] = warp_val; // write inclusive warp totals back
  }

  __syncthreads();

  // Add prefix from previous warps ----
  if (warpId > 0)
    val += warp_sums[warpId - 1];

  // Write to global output
  if (i < N)
    out[i] = val;

  // ---- 7️⃣ Write block sum (last thread) ----
  if (block_sums && tid == blockDim.x - 1)
    block_sums[blockIdx.x] = val;
}

__global__ void cte_sum(const uint32_t *arr, uint32_t *out)
{
  uint64_t i = blockIdx.x * blockDim.x + threadIdx.x;
  // trying to do prefix sum within each warp at first
  int laneId = threadIdx.x & 31;
  int warpId = threadIdx.x >> 5;
  __shared__ uint32_t shared[block_size]; // shared memory for each block
  if (i < N)
  {
    shared[threadIdx.x] = arr[i];
  }
  else
  {
    shared[threadIdx.x] = 0;
    return;
  }
  __syncwarp();
  for (int offset = 1; offset < warp_size; offset = offset * 2)
  {
    uint32_t val = 0;
    if (laneId >= offset)
    {
      val = shared[threadIdx.x - offset];
    }
    __syncwarp();
    shared[threadIdx.x] += val;
    __syncwarp();
  }
  __syncthreads();
  // now each warp has done its own prefix sum, we need to add the last elements of each warp to the next warps

  if (warpId == 0)
  {
    out[i] = shared[threadIdx.x];
    return;
  }
  for (int offset = 1; offset < blockDim.x / warp_size; offset = offset * 2)
  {
    uint32_t val = 0;
    if (warpId >= offset)
    {
      val = shared[(warpId - offset) * warp_size + warp_size - 1];
    }
    __syncthreads();
    shared[threadIdx.x] += val;
    __syncthreads();
  }
  out[i] = shared[threadIdx.x];
}

// Per-block inclusive scan; also writes the block total to block_sums (if non-null)
__global__ void scan_blocks_inclusive(const uint32_t *__restrict__ in,
                                      uint32_t *__restrict__ out,
                                      uint32_t *__restrict__ block_sums,
                                      int N)
{
  int g = blockIdx.x * blockDim.x + threadIdx.x;
  int t = threadIdx.x;

  extern __shared__ uint32_t sh[]; // size = blockDim.x * sizeof(uint32_t)
  sh[t] = (g < N) ? in[g] : 0u;
  __syncthreads();

  // Inclusive scan (simple, replace with warp shuffles for speed)
  for (int off = 1; off < blockDim.x; off <<= 1)
  {
    uint32_t v = (t >= off) ? sh[t - off] : 0u;
    __syncthreads();
    sh[t] += v;
    __syncthreads();
  }

  if (g < N)
    out[g] = sh[t];

  // Last thread of the block writes the block total
  if (block_sums && t == blockDim.x - 1)
  {
    int b = blockIdx.x;
    // If the last block is partial, its total is in sh[last_valid-1],
    // but since we padded with zeros, sh[blockDim.x-1] is fine:
    block_sums[b] = sh[blockDim.x - 1];
  }
}

// Add per-block offsets from a scanned block-prefix array of the same level
__global__ void add_block_offsets(uint32_t *__restrict__ out,
                                  const uint32_t *__restrict__ block_prefix, // inclusive scan of block sums
                                  int N)
{
  int g = blockIdx.x * blockDim.x + threadIdx.x;
  if (g >= N)
    return;

  int b = blockIdx.x;
  if (b == 0)
    return; // first block has no offset

  uint32_t offset = block_prefix[b - 1];
  out[g] += offset;
}

void device_inclusive_scan(uint32_t *d_in, uint32_t *d_out, int N, int block_size)
{
  int num_blocks = (N + block_size - 1) / block_size;

  // Allocate block sums (one per block)
  uint32_t *d_block_sums;
  cudaMalloc(&d_block_sums, num_blocks * sizeof(uint32_t));

  // ---- Phase 1: local scan per block ----
  size_t smem = block_size * sizeof(uint32_t);
  cte_sum_intrablock_fast<<<num_blocks, block_size, smem>>>(d_in, d_out, d_block_sums, N);

  // ---- Phase 2: scan block sums (recursive or CPU if small) ----
  uint32_t *d_block_prefix;
  cudaMalloc(&d_block_prefix, num_blocks * sizeof(uint32_t));

  if (num_blocks <= block_size)
  {
    // fits in one block → just one kernel
    size_t smem2 = num_blocks * sizeof(uint32_t);
    cte_sum_intrablock_fast<<<1, num_blocks, smem2>>>(d_block_sums, d_block_prefix, nullptr, num_blocks);
  }
  else
  {
    // too big → recursive call
    device_inclusive_scan(d_block_sums, d_block_prefix, num_blocks, block_size);
  }

  // ---- Phase 3: add block-level offsets ----
  add_block_offsets<<<num_blocks, block_size>>>(d_out, d_block_prefix, N);
  cudaCheckError(cudaGetLastError());
  cudaCheckError(cudaDeviceSynchronize());
  // Free temporary block arrays allocated inside this function
  cudaFree(d_block_sums);
  cudaFree(d_block_prefix);
}

__global__ void uvm_sum() {}

__host__ void check_result(const uint32_t *w_ref, const uint32_t *w_opt,
                           const uint64_t size)
{
  for (uint64_t i = 0; i < size; i++)
  {
    if (w_ref[i] != w_opt[i])
    {
      cout << "Differences found between the two arrays.\n";
      assert(false);
    }
  }
  cout << "No differences found between base and test versions\n";
}

__host__ void inclusive_prefix_sum(const uint32_t *input, uint32_t *output)
{
  output[0] = input[0];
  for (uint64_t i = 1; i < N; i++)
  {
    output[i] = output[i - 1] + input[i];
  }
}

int main()
{
  auto *h_input = new uint32_t[N];
  std::fill_n(h_input, N, 1);

  // std::inclusive_scan(h_input, h_input + N, std::ostream_iterator<int>(std::cout, " "));
  cout << "\n";

  auto *h_output_cpu = new uint32_t[N];
  inclusive_prefix_sum(h_input, h_output_cpu);

  dim3 blockSize(block_size);
  dim3 gridSize((N + blockSize.x - 1) / blockSize.x);
  int num_blocks = gridSize.x;

  uint32_t *d_arr, *d_out;
  cudaMalloc(&d_arr, N * sizeof(uint32_t));
  cudaMalloc(&d_out, N * sizeof(uint32_t));
  cudaMemcpy(d_arr, h_input, N * sizeof(uint32_t), cudaMemcpyHostToDevice);

  cudaEvent_t start, stop;
  cudaCheckError(cudaEventCreate(&start));
  cudaCheckError(cudaEventCreate(&stop));
  device_inclusive_scan(d_arr, d_out, N, block_size); //warmup
  cudaEventRecord(start);
  device_inclusive_scan(d_arr, d_out, N, block_size);
  cudaEventRecord(stop);
  cudaCheckError(cudaDeviceSynchronize());
  uint32_t *h_output_gpu = new uint32_t[N];
  cudaCheckError(
      cudaMemcpy(h_output_gpu, d_out, N * sizeof(uint32_t), cudaMemcpyDeviceToHost));
  cout << h_output_gpu[N - 1] << "\n";

  float milliseconds = 0;
  cudaCheckError(cudaEventElapsedTime(&milliseconds, start, stop));
  cout << "Time without UVM: " << milliseconds << " ms\n";
  cudaCheckError(cudaFree(d_arr));
  cudaCheckError(cudaFree(d_out));
  /*for(int i=0;i<N;i++)
    printf("%d ",h_output_gpu[i]);*/
  check_result(h_output_cpu, h_output_gpu, N);
  delete[] h_output_gpu;

  // TODO: Use a CUDA kernel with UVM, time your code
  uint32_t *uvm_input, *uvm_output;
  cudaMallocManaged(&uvm_input, N * sizeof(uint32_t));
  cudaMallocManaged(&uvm_output, N * sizeof(uint32_t));
  std::copy(h_input, h_input + N, uvm_input);
  device_inclusive_scan(uvm_input, uvm_output, N, block_size);
  cudaEventRecord(start);
  // Launch your UVM kernel here
  device_inclusive_scan(uvm_input, uvm_output, N, block_size);
  cudaEventRecord(stop);
  cudaCheckError(cudaDeviceSynchronize());
  milliseconds = 0;
  cudaCheckError(cudaEventElapsedTime(&milliseconds, start, stop));
  cout << "Time with UVM: " << milliseconds << " ms\n";
  cout << uvm_output[N - 1] << "\n";
  check_result(h_output_cpu, uvm_output, N);
  cudaFree(uvm_input);
  cudaFree(uvm_output);

  int dev = 0;
  cudaCheckError(cudaGetDevice(&dev));
  cudaMallocManaged(&uvm_input, N * sizeof(uint32_t));
  cudaMallocManaged(&uvm_output, N * sizeof(uint32_t));
  std::copy(h_input, h_input + N, uvm_input);
  std::fill_n(uvm_output, N, 0);
  cudaMemAdvise(uvm_input,N*sizeof(uint32_t),cudaMemAdviseSetAccessedBy,dev);
  cudaMemAdvise(uvm_output, N * sizeof(uint32_t),cudaMemAdviseSetAccessedBy,dev);
  device_inclusive_scan(uvm_input, uvm_output, N, block_size);
  std::fill_n(uvm_output, N, 0);
  cudaEventRecord(start);
  // Launch your UVM kernel here
  device_inclusive_scan(uvm_input, uvm_output, N, block_size);
  cudaEventRecord(stop);
  cudaCheckError(cudaDeviceSynchronize());
  milliseconds = 0;
  cudaCheckError(cudaEventElapsedTime(&milliseconds, start, stop));
  cout << "Time with UVM and Advise: " << milliseconds << " ms\n";
  cout << uvm_output[N - 1] << "\n";
  check_result(h_output_cpu, uvm_output, N);
  cudaFree(uvm_input);
  cudaFree(uvm_output);

  cudaMallocManaged(&uvm_input, N * sizeof(uint32_t));
  cudaMallocManaged(&uvm_output, N * sizeof(uint32_t));
  std::copy(h_input, h_input + N, uvm_input);
  cudaMemPrefetchAsync(uvm_input, N * sizeof(uint32_t), 0);
  cudaMemPrefetchAsync(uvm_output, N * sizeof(uint32_t), 0);
  device_inclusive_scan(uvm_input, uvm_output, N, block_size);
  cudaEventRecord(start);
  // Launch your UVM kernel here
  device_inclusive_scan(uvm_input, uvm_output, N, block_size);
  cudaEventRecord(stop);
  cudaCheckError(cudaDeviceSynchronize());
  milliseconds = 0;
  cudaCheckError(cudaEventElapsedTime(&milliseconds, start, stop));
  cout << "Time with UVM and Prefetch: " << milliseconds << " ms\n";
  cout << uvm_output[N - 1] << "\n";
  check_result(h_output_cpu, uvm_output, N);
  cudaFree(uvm_input);
  cudaFree(uvm_output);

  cudaMallocManaged(&d_arr, N *1000000000* sizeof(uint32_t)); //for oversubscription
  cudaMemPrefetchAsync(d_arr, N *1000000000* sizeof(uint32_t), 0);
  cudaMallocManaged(&uvm_input, N * sizeof(uint32_t));
  cudaMallocManaged(&uvm_output, N * sizeof(uint32_t));
  std::copy(h_input, h_input + N, uvm_input);
  cudaMemPrefetchAsync(uvm_input, N * sizeof(uint32_t), 0);
  cudaMemPrefetchAsync(uvm_output, N * sizeof(uint32_t), 0);
  device_inclusive_scan(uvm_input, uvm_output, N, block_size);
  cudaEventRecord(start);
  // Launch your UVM kernel here
  device_inclusive_scan(uvm_input, uvm_output, N, block_size);
  cudaEventRecord(stop);
  cudaCheckError(cudaDeviceSynchronize());
  milliseconds = 0;
  cudaCheckError(cudaEventElapsedTime(&milliseconds, start, stop));
  cout << "Time with UVM and oversubscription: " << milliseconds << " ms\n";
  cout << uvm_output[N - 1] << "\n";
  check_result(h_output_cpu, uvm_output, N);
  cudaFree(uvm_input);
  cudaFree(uvm_output);
  cudaFree(d_arr);
  delete[] h_input;
  delete[] h_output_cpu;

  return EXIT_SUCCESS;
}