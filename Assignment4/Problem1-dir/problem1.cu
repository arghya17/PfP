#include <cassert>
#include <chrono>
#include <cstdlib>
#include <cuda.h>
#include <iostream>
#include <numeric>

#define THRESHOLD (std::numeric_limits<double>::epsilon())

using std::cerr;
using std::cout;
using std::endl;

using std::chrono::duration_cast;
using HR = std::chrono::high_resolution_clock;
using HRTimer = HR::time_point;
using std::chrono::microseconds;
using std::chrono::milliseconds;

#define cudaCheckError(ans)                                                    \
{ gpuAssert((ans), __FILE__, __LINE__); }
inline void gpuAssert(cudaError_t code, const char* file, int line,
		bool abort = true) {
	if (code != cudaSuccess) {
		fprintf(stderr, "GPUassert: %s %s %d\n", cudaGetErrorString(code), file,
				line);
		if (abort)
			exit(code);
	}
}

const uint64_t N = (64);
const int tile_size= 4;
const int unroll_factor=2;
__global__ void naive_kernel(const double* in, double *out) {
	uint64_t i = blockIdx.x * blockDim.x + threadIdx.x + 1;
	uint64_t j = blockIdx.y * blockDim.y + threadIdx.y + 1;
	uint64_t k = blockIdx.z * blockDim.z + threadIdx.z + 1;

	if (i < (N - 1) && j < (N - 1) && k < (N - 1)) {
		out[i * N * N + j * N + k] =
			0.8 *
			(in[(i - 1) * N * N + j * N + k] + in[(i + 1) * N * N + j * N + k] +
			 in[i * N * N + (j - 1) * N + k] + in[i * N * N + (j + 1) * N + k] +
			 in[i * N * N + j * N + (k - 1)] + in[i * N * N + j * N + (k + 1)]);
	}
}

__global__ void shmem_kernel(const double * in , double *out) {
	__shared__ double tile[tile_size + 2][tile_size + 2][tile_size + 2];
	uint64_t i = blockIdx.x * blockDim.x + threadIdx.x + 1;
	uint64_t j = blockIdx.y * blockDim.y + threadIdx.y + 1;
	uint64_t k = blockIdx.z * blockDim.z + threadIdx.z + 1;
	tile[threadIdx.x + 1][threadIdx.y + 1][threadIdx.z + 1] =
		in[i * N * N + j * N + k];
	if (threadIdx.x == 0) {
		tile[0][threadIdx.y + 1][threadIdx.z + 1] =
			in[(i - 1) * N * N + j * N + k];
	}
	if (threadIdx.x == blockDim.x - 1) {
		tile[tile_size + 1][threadIdx.y + 1][threadIdx.z + 1] =
			in[(i + 1) * N * N + j * N + k];
	}
	if (threadIdx.y == 0) {
		tile[threadIdx.x + 1][0][threadIdx.z + 1] =
			in[i * N * N + (j - 1) * N + k];
	}
	if (threadIdx.y == blockDim.y - 1) {
		tile[threadIdx.x + 1][tile_size + 1][threadIdx.z + 1] =
			in[i * N * N + (j + 1) * N + k];
	}
	if (threadIdx.z == 0) {
		tile[threadIdx.x + 1][threadIdx.y + 1][0] =
			in[i * N * N + j * N + (k - 1)];
	}
	if (threadIdx.z == blockDim.z - 1) {
		tile[threadIdx.x + 1][threadIdx.y + 1][tile_size + 1] =
			in[i * N * N + j * N + (k + 1)];
	}
	__syncthreads();
	if (i < (N - 1) && j < (N - 1) && k < (N - 1)) {
		out[i * N * N + j * N + k] =
			0.8 *
			(tile[threadIdx.x][threadIdx.y + 1][threadIdx.z + 1] +
			 tile[threadIdx.x + 2][threadIdx.y + 1][threadIdx.z + 1] +
			 tile[threadIdx.x + 1][threadIdx.y][threadIdx.z + 1] +
			 tile[threadIdx.x + 1][threadIdx.y + 2][threadIdx.z + 1] +
			 tile[threadIdx.x + 1][threadIdx.y + 1][threadIdx.z] +
			 tile[threadIdx.x + 1][threadIdx.y + 1][threadIdx.z + 2]);
	}


}

__global__ void opt_kernel(const double *in, double *out)
{
    __shared__ double tile[tile_size + 2][tile_size + 2][tile_size + 2];

    // NEW ACCESS PATTERN:  x = global k, y = global j, z = global i
    uint64_t k = blockIdx.x * blockDim.x + threadIdx.x + 1;  // fastest
    uint64_t j = blockIdx.y * blockDim.y + threadIdx.y + 1;
    uint64_t i = blockIdx.z * blockDim.z + threadIdx.z + 1;  // slowest

    // map shared memory coords likewise
    uint64_t sx = threadIdx.x + 1;
    uint64_t sy = threadIdx.y + 1;
    uint64_t sz = threadIdx.z + 1;

    // Compute flattened index
    uint64_t idx = i * N * N + j * N + k;

    // CENTER LOAD
    tile[sz][sy][sx] = in[idx];

    // HALOS IN X (now X = z → slowest)
    if (threadIdx.z == 0)
        tile[0][sy][sx] = in[idx - (uint64_t)N * N];
    if (threadIdx.z == blockDim.z - 1)
        tile[tile_size + 1][sy][sx] = in[idx + (uint64_t)N * N];

    // HALOS IN Y (same)
    if (threadIdx.y == 0)
        tile[sz][0][sx] = in[idx - N];
    if (threadIdx.y == blockDim.y - 1)
        tile[sz][tile_size + 1][sx] = in[idx + N];

    // HALOS IN Z (fastest)
    if (threadIdx.x == 0)
        tile[sz][sy][0] = in[idx - 1];
    if (threadIdx.x == blockDim.x - 1)
        tile[sz][sy][tile_size + 1] = in[idx + 1];

    __syncthreads();

    // Compute stencil
    if (i < N - 1 && j < N - 1 && k < N - 1) {
        out[idx] =
            0.8 *
            ( tile[sz - 1][sy][sx] +  // i-1
              tile[sz + 1][sy][sx] +  // i+1
              tile[sz][sy - 1][sx] +  // j-1
              tile[sz][sy + 1][sx] +  // j+1
              tile[sz][sy][sx - 1] +  // k-1
              tile[sz][sy][sx + 1] ); // k+1
    }
}

__global__ void pinned_kernel() {}

__host__ void stencil(const double* in, double* out) {
	for (uint64_t i = 1; i < (N - 1); i++) {
		for (uint64_t j = 1; j < (N - 1); j++) {
			for (uint64_t k = 1; k < (N - 1); k++) {
				out[i * N * N + j * N + k] =
					0.8 *
					(in[(i - 1) * N * N + j * N + k] + in[(i + 1) * N * N + j * N + k] +
					 in[i * N * N + (j - 1) * N + k] + in[i * N * N + (j + 1) * N + k] +
					 in[i * N * N + j * N + (k - 1)] + in[i * N * N + j * N + (k + 1)]);
			}
		}
	}
}

__host__ void check_result(const double* w_ref, const double* w_opt,
		const uint64_t size) {
	double maxdiff = 0.0;
	int numdiffs = 0;

	for (uint64_t i = 0; i < size; i++) {
		for (uint64_t j = 0; j < size; j++) {
			for (uint64_t k = 0; k < size; k++) {
				double this_diff =
					w_ref[i + N * j + N * N * k] - w_opt[i + N * j + N * N * k];
				if (std::fabs(this_diff) > THRESHOLD) {
					numdiffs++;
					if (this_diff > maxdiff) {
						maxdiff = this_diff;
					}
				}
			}
		}
	}

	if (numdiffs > 0) {
		cout << numdiffs << " Diffs found over THRESHOLD " << THRESHOLD
			<< "; Max Diff = " << maxdiff << endl;
	} else {
		cout << "No differences found between base and test versions\n";
	}
}

void print_mat(const double* A) {
	for (int i = 0; i < N; ++i) {
		for (int j = 0; j < N; ++j) {
			for (int k = 0; k < N; ++k) {
				printf("%lf,", A[i * N * N + j * N + k]);
			}
			printf("      ");
		}
		printf("\n");
	}
}

int main() {
	uint64_t NUM_ELEMS = (N * N * N);
	uint64_t SIZE_BYTES = (N * N * N) * sizeof(double);

	auto* h_in = new double[NUM_ELEMS];
	double* h_in_pinned = nullptr;
	cudaHostAlloc((void**)&h_in_pinned, SIZE_BYTES, cudaHostAllocDefault);
	auto* h_out_cpu = new double[NUM_ELEMS];
	auto* h_out_gpu = new double[NUM_ELEMS];

	srand(42);
	for (uint64_t i = 0; i < NUM_ELEMS; i++) {
		h_in[i] = static_cast<double>(rand());
		h_in_pinned[i] = h_in[i];
	}
	std::fill_n(h_out_cpu, NUM_ELEMS, 0.0);
	std::fill_n(h_out_gpu, NUM_ELEMS, 0.0);

	auto cpu_start = HR::now();
	stencil(h_in, h_out_cpu);
	auto cpu_end = HR::now();
	auto duration = duration_cast<microseconds>(cpu_end - cpu_start).count();
	cout << "Stencil time on CPU: " << duration << " us\n";

	cudaError_t status;

	cudaEvent_t start, end;
	cudaEventCreate(&start);
	cudaEventCreate(&end);
	double *d_in, *d_out;
	cudaMalloc((void **)&d_in,sizeof(double) * NUM_ELEMS);
	cudaMalloc((void **)&d_out,sizeof(double) * NUM_ELEMS);
	cudaMemcpy(d_in, h_in, SIZE_BYTES, cudaMemcpyHostToDevice);
	naive_kernel<<<dim3((N + 7) / 8, (N + 7) / 8, (N + 7) / 8), dim3(8, 8, 8)>>>(d_in, d_out);
	cudaEventRecord(start);
	
	naive_kernel<<<dim3((N + 7) / 8, (N + 7) / 8, (N + 7) / 8), dim3(8, 8, 8)>>>(d_in, d_out);
	// TODO: Fill in kernel1
	// TODO: Adapt check_result() and invoke
	cudaEventRecord(end);
	cudaEventSynchronize(end);
	cudaMemcpy(h_out_gpu, d_out, SIZE_BYTES, cudaMemcpyDeviceToHost);
	check_result(h_out_cpu, h_out_gpu, N);
	float kernel_time = 0.0f;
	cudaEventElapsedTime(&kernel_time, start, end);
	cudaFree(d_in);
	cudaFree(d_out);
	cout << "Naive kernel time: " << kernel_time*1000 << " us\n";
	cudaMalloc((void **)&d_in,sizeof(double) * NUM_ELEMS);
	cudaMalloc((void **)&d_out,sizeof(double) * NUM_ELEMS);
	cudaMemcpy(d_in, h_in, SIZE_BYTES, cudaMemcpyHostToDevice);
	shmem_kernel<<<dim3((N + tile_size-1) / tile_size, (N + tile_size-1) / tile_size, (N +tile_size-1) / tile_size), dim3(tile_size, tile_size, tile_size)>>>(d_in, d_out);
	cudaEventRecord(start);
	shmem_kernel<<<dim3((N + tile_size-1) / tile_size, (N + tile_size-1) / tile_size, (N +tile_size-1) / tile_size), dim3(tile_size, tile_size, tile_size)>>>(d_in, d_out);
	// TODO: Adapt check_result() and invoke
	cudaEventRecord(end);
	cudaEventSynchronize(end);
	cudaEventElapsedTime(&kernel_time, start, end);
	cudaMemcpy(h_out_gpu, d_out, SIZE_BYTES, cudaMemcpyDeviceToHost);
	check_result(h_out_cpu, h_out_gpu, N);
	cudaFree(d_in);
	cudaFree(d_out);
	std::cout << "Shmem kernel time: " << kernel_time*1000 << " us\n";

  cudaMalloc((void **)&d_in,sizeof(double) * NUM_ELEMS);
	cudaMalloc((void **)&d_out,sizeof(double) * NUM_ELEMS);
	cudaMemcpy(d_in, h_in, SIZE_BYTES, cudaMemcpyHostToDevice);
	opt_kernel<<<dim3((N + tile_size-1) / tile_size, (N + tile_size-1) / tile_size, (N +tile_size-1) /(tile_size)), dim3(tile_size, tile_size, tile_size)>>>(d_in, d_out);
	cudaEventRecord(start);
	opt_kernel<<<dim3((N + tile_size-1) / tile_size, (N + tile_size-1) / tile_size, (N +tile_size-1) /(tile_size)), dim3(tile_size, tile_size, tile_size)>>>(d_in, d_out);
	// TODO: Adapt check_result() and invoke
	cudaEventRecord(end);
	cudaEventSynchronize(end);
	cudaEventElapsedTime(&kernel_time, start, end);
	cudaMemcpy(h_out_gpu, d_out, SIZE_BYTES, cudaMemcpyDeviceToHost);
	check_result(h_out_cpu, h_out_gpu, N);
	cudaFree(d_in);
	cudaFree(d_out);
	std::cout << "Opt kernel time with change in access pattern: " << kernel_time*1000 << " us\n";

	cudaMalloc((void **)&d_in,sizeof(double) * NUM_ELEMS);
	cudaMalloc((void **)&d_out,sizeof(double) * NUM_ELEMS);
	float h2d_unpinned_time=0.0f;
	cudaEventRecord(start);
	cudaMemcpy(d_in, h_in, SIZE_BYTES, cudaMemcpyHostToDevice);
	cudaEventRecord(end);
	cudaEventSynchronize(end);
	cudaEventElapsedTime(&h2d_unpinned_time, start, end);
	opt_kernel<<<dim3((N + tile_size-1) / tile_size, (N + tile_size-1) / tile_size, (N +tile_size-1) /(tile_size)), dim3(tile_size, tile_size, tile_size)>>>(d_in, d_out);
	cudaEventRecord(start);
	opt_kernel<<<dim3((N + tile_size-1) / tile_size, (N + tile_size-1) / tile_size, (N +tile_size-1) /(tile_size)), dim3(tile_size, tile_size, tile_size)>>>(d_in, d_out);	
	cudaEventRecord(end);
	cudaEventSynchronize(end);
	cudaEventElapsedTime(&kernel_time, start, end);
	cudaMemcpy(h_out_gpu, d_out, SIZE_BYTES, cudaMemcpyDeviceToHost);
	check_result(h_out_cpu, h_out_gpu, N);
	cudaFree(d_in);
	cudaFree(d_out);
	std::cout << "Total Opt kernel time with unpinned memory: " << (kernel_time+h2d_unpinned_time)*1000 << " us\n";

	cudaMalloc((void **)&d_in,sizeof(double) * NUM_ELEMS);
	cudaMalloc((void **)&d_out,sizeof(double) * NUM_ELEMS);
	float h2d_pinned_time=0.0f;
	cudaEventRecord(start);
	cudaMemcpy(d_in, h_in_pinned, SIZE_BYTES, cudaMemcpyHostToDevice);
	cudaEventRecord(end);
	cudaEventSynchronize(end);
	cudaEventElapsedTime(&h2d_pinned_time, start, end);
	opt_kernel<<<dim3((N + tile_size-1) / tile_size, (N + tile_size-1) / tile_size, (N +tile_size-1) /(tile_size)), dim3(tile_size, tile_size, tile_size)>>>(d_in, d_out);	
	cudaEventRecord(start);
	opt_kernel<<<dim3((N + tile_size-1) / tile_size, (N + tile_size-1) / tile_size, (N +tile_size-1) /(tile_size)), dim3(tile_size, tile_size, tile_size)>>>(d_in, d_out);
	cudaEventRecord(end);
	cudaEventSynchronize(end);
	cudaEventElapsedTime(&kernel_time, start, end);
	cudaMemcpy(h_out_gpu, d_out, SIZE_BYTES, cudaMemcpyDeviceToHost);
	check_result(h_out_cpu, h_out_gpu, N);
	cudaFree(d_in);
	cudaFree(d_out);
	std::cout << "Total Opt kernel time with pinned memory: " << (kernel_time+h2d_pinned_time)*1000 << " us\n";
	cudaFreeHost(h_in_pinned);

	free(h_in);
	free(h_out_cpu);

	free(h_out_gpu);
	// TODO: Free memory

	return EXIT_SUCCESS;
}