#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <cuda.h>
#include <iostream>
#include <iomanip> 
#include <fstream>

#define NSEC_SEC_MUL (1.0e9)

// Constant memory for parameters - match the original parameter structure
__constant__ double c_dd[30];  // grid parameters (b[0] to b[29])
__constant__ int s[10];
__constant__ double c_c[100];   // flattened 10x10 matrix (a[0] to a[99])
__constant__ double c_d[10];    // d vector (a[100] to a[109])
__constant__ double c_ey[10];   // ey vector (a[110] to a[119])
__constant__ double c_kk;       // kk scalar

__device__ unsigned int pnts = 0;

inline unsigned long long div_up_unsigned(unsigned long long a, unsigned long long b) {
    return (a + b - 1ULL) / b;
}

__global__ void gridloopsearch(double * __restrict__ output, unsigned int *pnts, uint64_t N)
{
    double x[10], q[10], e[10];

    for (int j = 0; j < 10; ++j)
        e[j] = c_kk * c_ey[j];

    for (int j = 0; j < 10; ++j)
        x[j] = c_dd[j * 3 + 0];  

    
    /*int s[10];
    for (int j = 0; j < 10; ++j)
        s[j] = (int)floor((c_dd[j * 3 + 1] - c_dd[j * 3 + 0]) / c_dd[j * 3 + 2]);*/

    
    uint64_t i = (uint64_t)blockIdx.y * (uint64_t)blockDim.y +
                 (uint64_t)blockIdx.x * blockDim.x + (uint64_t)threadIdx.x;
    if (i >= N) return;

    int r[10];
    for (int j = 9; j >= 0; --j) {  
        r[j] = i % s[j];
        i =i / s[j];
    }

   
    for (int j = 0; j < 10; ++j)
        x[j] = c_dd[j * 3 ] + (double)r[j] * c_dd[j * 3 + 2];

    
    for (int row = 0; row < 10; ++row) {
        double sum = 0.0;
        for (int col = 0; col < 10; ++col)
            sum += c_c[row * 10 + col] * x[col];
        q[row] = fabs(sum - c_d[row]);
    }

    bool ok = true;
    for (int j = 0; j < 10; ++j)
        if (q[j] > e[j]) { ok = false; break; }

    if (ok) {
        unsigned int slot = atomicAdd(pnts, 1); 
        double *line = output + slot * 10;
        for (int j = 0; j < 10; ++j)
            line[j] = x[j];
    }
}
struct timespec begin_grid, end_main;

// to store values of disp.txt
double a[120];

// to store values of grid.txt
double b[30];
int main()
{
    int i, j;

    i = 0;
    FILE *fp = fopen("./disp.txt", "r");
    if (fp == NULL)
    {
        printf("Error: could not open file\n");
        return 1;
    }

    while (!feof(fp))
    {
        if (!fscanf(fp, "%lf", &a[i]))
        {
            printf("Error: fscanf failed while reading disp.txt\n");
            exit(EXIT_FAILURE);
        }
        i++;
    }
    fclose(fp);

    // read grid file
    j = 0;
    FILE *fpq = fopen("./grid.txt", "r");
    if (fpq == NULL)
    {
        printf("Error: could not open file\n");
        return 1;
    }

    while (!feof(fpq))
    {
        if (!fscanf(fpq, "%lf", &b[j]))
        {
            printf("Error: fscanf failed while reading grid.txt\n");
            exit(EXIT_FAILURE);
        }
        j++;
    }
    fclose(fpq);
    double cpu_c[100];
    double cpu_d[10];
    double cpu_e[10];
    for(i=0;i<120;i++){
    	if(i%12==10){
    	   cpu_d[i/12]=a[i];
    	}
    	if(i%12==11){
    	   cpu_e[i/12]=a[i];
    	}
    	else 
    	{
           cpu_c[(i/12)*10+(i%12)]=a[i];
    	}
    }
    // Copy parameters to constant memory - FIXED VERSION
    cudaMemcpyToSymbol(c_dd, b, 30 * sizeof(double));
    
    // Copy the matrix c (first 100 elements of a)
    cudaMemcpyToSymbol(c_c, cpu_c, 100 * sizeof(double));
    
    // Copy d vector (elements 100-109 of a)
    cudaMemcpyToSymbol(c_d, cpu_d, 10 * sizeof(double));
    
    // Copy ey vector (elements 110-119 of a)  
    cudaMemcpyToSymbol(c_ey, cpu_e, 10 * sizeof(double));
    
    // grid value initialize
    // initialize value of kk;
    double kk = 0.3;
    cudaMemcpyToSymbol(c_kk, &kk, sizeof(double));

    
    double *d_output;
    unsigned int d_pnts_cpu = 0;
    unsigned int *d_pnts;
    int s_cpu[10];
    unsigned long long N=1;
	for (int i = 0; i < 10; i++) {
	    int base_index = i * 3;
	    s_cpu[i] = (int)floor((b[base_index + 1] - b[base_index]) / b[base_index + 2]);
	    N=N*(unsigned long long)s_cpu[i];
	}
   cudaMemcpyToSymbol(s, s_cpu, 10*sizeof(int));
    
    int M=13000;
    uint64_t block_size = 512ULL;

    uint64_t num_blocks = div_up_unsigned(N, block_size);
    printf("Total configurations: %llu\n", N);
  
    cudaMalloc(&d_output, M*10*sizeof(double));
    cudaMalloc(&d_pnts, sizeof(unsigned int));

    // initialize counter to 0
    cudaMemset(d_pnts, 0, sizeof(unsigned int));
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    dim3 grid, block;
    uint64_t maxGridX = 2147483647ULL;
    block.x = block_size;

    if (num_blocks <= maxGridX) {
        grid = dim3((unsigned)num_blocks, 1);
    } else {
        grid.x = (unsigned)maxGridX;
        grid.y = (unsigned)((num_blocks + maxGridX - 1ULL) / maxGridX);
    }

    printf("Grid dimensions: %u x %u, Block size: %u\n", grid.x, grid.y, block.x);

    // Record start time
    cudaEventRecord(start);
    
    // Launch kernel with only output and counter parameters
    gridloopsearch<<<grid, block>>>(d_output, d_pnts, N);

    cudaEventRecord(stop);
    // Wait for kernel to finish
    cudaEventSynchronize(stop);
    
    // Check for kernel errors
    cudaError_t err = cudaGetLastError();
    if (err != cudaSuccess) {
        printf("Kernel launch error: %s\n", cudaGetErrorString(err));
        return 1;
    }
    
    // Compute elapsed time (in milliseconds)
    float milliseconds = 0;
    cudaEventElapsedTime(&milliseconds, start, stop);
    cudaMemcpy(&d_pnts_cpu, d_pnts, sizeof(int), cudaMemcpyDeviceToHost);
    printf("Number of points found: %d\n", d_pnts_cpu);

    // Print timing
    printf("gridloopsearch execution time: %.3f ms\n", milliseconds);
    
    double *h_output = new double[M*10];
    cudaMemcpy(h_output, d_output, M*10*sizeof(double), cudaMemcpyDeviceToHost);
    std::ofstream fout("result-v2.txt");
    if (!fout) {
        std::cerr << "Failed to open result-v2.txt\n";
        return 1;
    }

      for (int i = 0; i < d_pnts_cpu; ++i) {
        double *row = h_output + i * 10;  // Each row has 10 doubles
        
        fout << std::fixed << std::setprecision(6);
        fout << row[0] << "\t" << row[1] << "\t" << row[2] << "\t" 
             << row[3] << "\t" << row[4] << "\t" << row[5] << "\t" 
             << row[6] << "\t" << row[7] << "\t" << row[8] << "\t" 
             << row[9] << "\n";
    }

    fout.close();

    // cleanup
    cudaFree(d_output);
    delete[] h_output;

    std::cout << "✅ Results written to result-v2.txt\n";

    return EXIT_SUCCESS;
}