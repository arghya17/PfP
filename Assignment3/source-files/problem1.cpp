#include <chrono>
#include <cmath>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <limits.h>
#include <omp.h>

using std::cout;
using std::endl;

using std::chrono::duration_cast;
using HR = std::chrono::high_resolution_clock;
using HRTimer = HR::time_point;
using std::chrono::microseconds;
using std::chrono::milliseconds;

const uint64_t TIMESTEPS = 100;

const double W_OWN = (1.0 / 7.0);
const double W_NEIGHBORS = (1.0 / 7.0);

const uint64_t NX = 66; // 64 interior points + 2 boundary points
const uint64_t NY = 66;
const uint64_t NZ = 66;
const uint64_t TOTAL_SIZE = NX * NY * NZ;

const static double EPSILON = std::numeric_limits<double>::epsilon();

void stencil_3d_7pt(const double *curr, double *next)
{
  for (int i = 1; i < NX - 1; ++i)
  {
    for (int j = 1; j < NY - 1; ++j)
    {
      for (int k = 1; k < NZ - 1; ++k)
      {
        double neighbors_sum = 0.0;
        neighbors_sum += curr[(i + 1) * NY * NZ + j * NZ + k];
        neighbors_sum += curr[(i - 1) * NY * NZ + j * NZ + k];
        neighbors_sum += curr[i * NY * NZ + (j + 1) * NZ + k];
        neighbors_sum += curr[i * NY * NZ + (j - 1) * NZ + k];
        neighbors_sum += curr[i * NY * NZ + j * NZ + (k + 1)];
        neighbors_sum += curr[i * NY * NZ + j * NZ + (k - 1)];

        next[i * NY * NZ + j * NZ + k] =
            W_OWN * curr[i * NY * NZ + j * NZ + k] +
            W_NEIGHBORS * neighbors_sum;
      }
    }
  }
}

void stencil_3d_7pt_method1(const double *curr, double *next)
{
  // Method 1 forward substitution to help vectorization
  for (int i = 1; i < NX - 1; ++i)
  {
    for (int j = 1; j < NY - 1; ++j)
    {
      for (int k = 1; k < NZ - 1; ++k)
      {
        next[i * NY * NZ + j * NZ + k] =
            W_OWN * curr[i * NY * NZ + j * NZ + k] +
            W_NEIGHBORS * (curr[(i + 1) * NY * NZ + j * NZ + k] + curr[(i - 1) * NY * NZ + j * NZ + k] +
                           curr[i * NY * NZ + (j + 1) * NZ + k] +
                           curr[i * NY * NZ + (j - 1) * NZ + k] +
                           curr[i * NY * NZ + j * NZ + (k + 1)] +
                           curr[i * NY * NZ + j * NZ + (k - 1)]);
      }
    }
  }
}

void stencil_3d_7pt_method2(const double *__restrict__ curr, double *__restrict__ next)
{
  // Method 2 - remove neighbors_sum variable to stop any undue dependency chains and restrict to hint no aliasing
  // this method is successfully vectorized automatically by the compiler
  for (int i = 1; i < NX - 1; ++i)
  {
    const int idx_i = i * NY * NZ;
    const int idx_ip1 = (i + 1) * NY * NZ;
    const int idx_im1 = (i - 1) * NY * NZ;

    for (int j = 1; j < NY - 1; ++j)
    {
      const int idx_ij = idx_i + j * NZ;
      const int idx_ip1j = idx_ip1 + j * NZ;
      const int idx_im1j = idx_im1 + j * NZ;
      const int idx_ijp1 = idx_i + (j + 1) * NZ;
      const int idx_ijm1 = idx_i + (j - 1) * NZ;

      // Now the k loop has only +k offsets → vectorizable
      for (int k = 1; k < NZ - 1; ++k)
      {
        next[idx_ij + k] =
            W_OWN * curr[idx_ij + k] +
            W_NEIGHBORS * (curr[idx_ip1j + k] +
                           curr[idx_im1j + k] +
                           curr[idx_ijp1 + k] +
                           curr[idx_ijm1 + k] +
                           curr[idx_ij + k + 1] +
                           curr[idx_ij + k - 1]);
      }
    }
  }
}

void stencil_3d_7pt_method3(const double *__restrict__ curr,
                            double *__restrict__ next)
{
  const int BK = 4; // Block size in k dimension

  for (int i = 1; i < NX - 1; ++i)
  {
    const int idx_i = i * NY * NZ;
    const int idx_ip1 = (i + 1) * NY * NZ;
    const int idx_im1 = (i - 1) * NY * NZ;

    for (int j = 1; j < NY - 1; ++j)
    {
      const int idx_ij = idx_i + j * NZ;
      const int idx_ip1j = idx_ip1 + j * NZ;
      const int idx_im1j = idx_im1 + j * NZ;
      const int idx_ijp1 = idx_i + (j + 1) * NZ;
      const int idx_ijm1 = idx_i + (j - 1) * NZ;

      // Blocking in k dimension
      for (int kb = 1; kb < NZ - 1; kb += BK)
      {
        const int kend = (kb + BK < NZ - 1) ? (kb + BK) : (NZ - 1);
        for (int k = kb; k < kend; ++k)
        {
          next[idx_ij + k] =
              W_OWN * curr[idx_ij + k] +
              W_NEIGHBORS * (curr[idx_ip1j + k] +
                             curr[idx_im1j + k] +
                             curr[idx_ijp1 + k] +
                             curr[idx_ijm1 + k] +
                             curr[idx_ij + k + 1] +
                             curr[idx_ij + k - 1]);
        }
      }
    }
  }
}
void stencil_3d_7pt_method4(const double *__restrict__ curr,
                            double *__restrict__ next)
{

  // trying loop unrolling along k dimension
  for (int i = 1; i < NX - 1; ++i)
  {
    const int idx_i = i * NY * NZ;
    const int idx_ip1 = (i + 1) * NY * NZ;
    const int idx_im1 = (i - 1) * NY * NZ;

    for (int j = 1; j < NY - 1; ++j)
    {
      const int idx_ij = idx_i + j * NZ;
      const int idx_ip1j = idx_ip1 + j * NZ;
      const int idx_im1j = idx_im1 + j * NZ;
      const int idx_ijp1 = idx_i + (j + 1) * NZ;
      const int idx_ijm1 = idx_i + (j - 1) * NZ;

      int k = 1;
      // Unroll the loop by 4
      for (; k + 3 < NZ - 1; k += 4)
      {
        // k
        next[idx_ij + k] =
            W_OWN * curr[idx_ij + k] +
            W_NEIGHBORS * (curr[idx_ip1j + k] +
                           curr[idx_im1j + k] +
                           curr[idx_ijp1 + k] +
                           curr[idx_ijm1 + k] +
                           curr[idx_ij + k + 1] +
                           curr[idx_ij + k - 1]);

        // k+1
        next[idx_ij + (k + 1)] =
            W_OWN * curr[idx_ij + (k + 1)] +
            W_NEIGHBORS * (curr[idx_ip1j + (k + 1)] +
                           curr[idx_im1j + (k + 1)] +
                           curr[idx_ijp1 + (k + 1)] +
                           curr[idx_ijm1 + (k + 1)] +
                           curr[idx_ij + (k + 2)] +
                           curr[idx_ij + k]);

        // k+2
        next[idx_ij + (k + 2)] =
            W_OWN * curr[idx_ij + (k + 2)] +
            W_NEIGHBORS * (curr[idx_ip1j + (k + 2)] +
                           curr[idx_im1j + (k + 2)] +
                           curr[idx_ijp1 + (k + 2)] +
                           curr[idx_ijm1 + (k + 2)] +
                           curr[idx_ij + (k + 3)] +
                           curr[idx_ij + (k + 1)]);

        // k+3
        next[idx_ij + (k + 3)] =
            W_OWN * curr[idx_ij + (k + 3)] +
            W_NEIGHBORS * (curr[idx_ip1j + (k + 3)] +
                           curr[idx_im1j + (k + 3)] +
                           curr[idx_ijp1 + (k + 3)] +
                           curr[idx_ijm1 + (k + 3)] +
                           curr[idx_ij + (k + 4)] +
                           curr[idx_ij + (k + 2)]);
      }

      // Cleaning the remaining iterations
      for (; k < NZ - 1; ++k)
      {
        next[idx_ij + k] =
            W_OWN * curr[idx_ij + k] +
            W_NEIGHBORS * (curr[idx_ip1j + k] +
                           curr[idx_im1j + k] +
                           curr[idx_ijp1 + k] +
                           curr[idx_ijm1 + k] +
                           curr[idx_ij + k + 1] +
                           curr[idx_ij + k - 1]);
      }
    }
  }
}

void stencil_3d_7pt_method5(const double *__restrict__ curr, double *__restrict__ next)
{
  // Method 5 - combine restrict with omp parallel for
#pragma omp parallel for
  for (int i = 1; i < NX - 1; ++i)
  {
    const int idx_i = i * NY * NZ;
    const int idx_ip1 = (i + 1) * NY * NZ;
    const int idx_im1 = (i - 1) * NY * NZ;

    for (int j = 1; j < NY - 1; ++j)
    {
      const int idx_ij = idx_i + j * NZ;
      const int idx_ip1j = idx_ip1 + j * NZ;
      const int idx_im1j = idx_im1 + j * NZ;
      const int idx_ijp1 = idx_i + (j + 1) * NZ;
      const int idx_ijm1 = idx_i + (j - 1) * NZ;

      // Now the k loop has only +k offsets → vectorizable
      for (int k = 1; k < NZ - 1; ++k)
      {
        next[idx_ij + k] =
            W_OWN * curr[idx_ij + k] +
            W_NEIGHBORS * (curr[idx_ip1j + k] +
                           curr[idx_im1j + k] +
                           curr[idx_ijp1 + k] +
                           curr[idx_ijm1 + k] +
                           curr[idx_ij + k + 1] +
                           curr[idx_ij + k - 1]);
      }
    }
  }
}

void stencil_3d_7pt_method6(const double *__restrict__ curr, double *__restrict__ next)
{
  // Method 6 - combine restrict with omp parallel for and collapsing the first two loops
#pragma omp parallel for collapse(2)
  for (int i = 1; i < NX - 1; ++i)
  {
    const int idx_i = i * NY * NZ;
    const int idx_ip1 = (i + 1) * NY * NZ;
    const int idx_im1 = (i - 1) * NY * NZ;

    for (int j = 1; j < NY - 1; ++j)
    {
      const int idx_ij = idx_i + j * NZ;
      const int idx_ip1j = idx_ip1 + j * NZ;
      const int idx_im1j = idx_im1 + j * NZ;
      const int idx_ijp1 = idx_i + (j + 1) * NZ;
      const int idx_ijm1 = idx_i + (j - 1) * NZ;

      // Now the k loop has only +k offsets → vectorizable
      for (int k = 1; k < NZ - 1; ++k)
      {
        next[idx_ij + k] =
            W_OWN * curr[idx_ij + k] +
            W_NEIGHBORS * (curr[idx_ip1j + k] +
                           curr[idx_im1j + k] +
                           curr[idx_ijp1 + k] +
                           curr[idx_ijm1 + k] +
                           curr[idx_ij + k + 1] +
                           curr[idx_ij + k - 1]);
      }
    }
  }
}
int main()
{
  auto *grid1 = new double[TOTAL_SIZE];
  std::fill_n(grid1, TOTAL_SIZE, 0.0);
  grid1[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)] = 100.0;

  auto *grid2 = new double[TOTAL_SIZE];
  std::fill_n(grid2, TOTAL_SIZE, 0.0);
  grid2[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)] = 100.0;

  double *current_grid = grid1;
  double *next_grid = grid2;
  double final_scalar = 0.0;
  double final_sum_scalar = 0.0;
  auto start = HR::now();
  for (int t = 0; t < TIMESTEPS; t++)
  {
    stencil_3d_7pt(current_grid, next_grid);
    std::swap(current_grid, next_grid);
  }
  auto end = HR::now();
  auto duration = duration_cast<milliseconds>(end - start).count();
  cout << "Scalar kernel time: " << duration << " ms" << endl;

  double final = current_grid[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)];
  final_scalar = final;
  cout << "Final value at center: " << final << "\n";
  double total_sum = 0.0;
  for (size_t i = 0; i < TOTAL_SIZE; i++)
  {
    total_sum += current_grid[i];
  }
  final_sum_scalar = total_sum;
  cout << "Total sum : " << total_sum << "\n";

  // Assert on final value at the center and the total sum for the other variants
  // that you come up with. We are dealing with doubles.

  delete[] grid1;
  delete[] grid2;

  cout << "\nRunning Method 1 version\n";
  // method 1
  grid1 = new double[TOTAL_SIZE];
  std::fill_n(grid1, TOTAL_SIZE, 0.0);
  grid1[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)] = 100.0;

  grid2 = new double[TOTAL_SIZE];
  std::fill_n(grid2, TOTAL_SIZE, 0.0);
  grid2[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)] = 100.0;
  current_grid = grid1;
  next_grid = grid2;
  start = HR::now();
  for (int t = 0; t < TIMESTEPS; t++)
  {
    stencil_3d_7pt_method1(current_grid, next_grid);
    std::swap(current_grid, next_grid);
  }
  end = HR::now();
  duration = duration_cast<milliseconds>(end - start).count();
  cout << "Scalar kernel time: " << duration << " ms" << endl;

  final = current_grid[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)];
  cout << "Final value at center: " << final << " final scalar assertion is " << (std::fabs(final_scalar - final) < EPSILON) << "\n";
  total_sum = 0.0;
  for (size_t i = 0; i < TOTAL_SIZE; i++)
  {
    total_sum += current_grid[i];
  }
  final_sum_scalar = total_sum;
  cout << "Total sum : " << total_sum << " total_sum assertion is " << (final_sum_scalar == total_sum) << "\n";

  // Assert on final value at the center and the total sum for the other variants
  // that you come up with. We are dealing with doubles.

  delete[] grid1;
  delete[] grid2;

  cout << "\nRunning Method 2 version\n";
  // method 1
  grid1 = new double[TOTAL_SIZE];
  std::fill_n(grid1, TOTAL_SIZE, 0.0);
  grid1[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)] = 100.0;

  grid2 = new double[TOTAL_SIZE];
  std::fill_n(grid2, TOTAL_SIZE, 0.0);
  grid2[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)] = 100.0;
  current_grid = grid1;
  next_grid = grid2;
  start = HR::now();
  for (int t = 0; t < TIMESTEPS; t++)
  {
    stencil_3d_7pt_method2(current_grid, next_grid);
    std::swap(current_grid, next_grid);
  }
  end = HR::now();
  duration = duration_cast<milliseconds>(end - start).count();
  cout << "Scalar kernel time: " << duration << " ms" << endl;

  final = current_grid[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)];
  cout << "Final value at center: " << final << " final scalar assertion is " << (std::fabs(final_scalar - final) < EPSILON) << "\n";
  total_sum = 0.0;
  for (size_t i = 0; i < TOTAL_SIZE; i++)
  {
    total_sum += current_grid[i];
  }
  final_sum_scalar = total_sum;
  cout << "Total sum : " << total_sum << " total_sum assertion is " << (final_sum_scalar == total_sum) << "\n";

  // Assert on final value at the center and the total sum for the other variants
  // that you come up with. We are dealing with doubles.

  delete[] grid1;
  delete[] grid2;

  cout << "\nRunning Method 3 version\n";
  // method 1
  grid1 = new double[TOTAL_SIZE];
  std::fill_n(grid1, TOTAL_SIZE, 0.0);
  grid1[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)] = 100.0;

  grid2 = new double[TOTAL_SIZE];
  std::fill_n(grid2, TOTAL_SIZE, 0.0);
  grid2[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)] = 100.0;
  current_grid = grid1;
  next_grid = grid2;
  start = HR::now();
  for (int t = 0; t < TIMESTEPS; t++)
  {
    stencil_3d_7pt_method3(current_grid, next_grid);
    std::swap(current_grid, next_grid);
  }
  end = HR::now();
  duration = duration_cast<milliseconds>(end - start).count();
  cout << "Scalar kernel time: " << duration << " ms" << endl;

  final = current_grid[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)];
  cout << "Final value at center: " << final << " final scalar assertion is " << (std::fabs(final_scalar - final) < EPSILON) << "\n";
  total_sum = 0.0;
  for (size_t i = 0; i < TOTAL_SIZE; i++)
  {
    total_sum += current_grid[i];
  }
  final_sum_scalar = total_sum;
  cout << "Total sum : " << total_sum << " total_sum assertion is " << (final_sum_scalar == total_sum) << "\n";

  // Assert on final value at the center and the total sum for the other variants
  // that you come up with. We are dealing with doubles.

  delete[] grid1;
  delete[] grid2;

  cout << "\nRunning Method 4 version\n";
  // method 1
  grid1 = new double[TOTAL_SIZE];
  std::fill_n(grid1, TOTAL_SIZE, 0.0);
  grid1[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)] = 100.0;

  grid2 = new double[TOTAL_SIZE];
  std::fill_n(grid2, TOTAL_SIZE, 0.0);
  grid2[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)] = 100.0;
  current_grid = grid1;
  next_grid = grid2;
  start = HR::now();
  for (int t = 0; t < TIMESTEPS; t++)
  {
    stencil_3d_7pt_method4(current_grid, next_grid);
    std::swap(current_grid, next_grid);
  }
  end = HR::now();
  duration = duration_cast<milliseconds>(end - start).count();
  cout << "Scalar kernel time: " << duration << " ms" << endl;

  final = current_grid[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)];
  cout << "Final value at center: " << final << " final scalar assertion is " << ((std::fabs(final_scalar - final) < EPSILON)) << "\n";
  total_sum = 0.0;
  for (size_t i = 0; i < TOTAL_SIZE; i++)
  {
    total_sum += current_grid[i];
  }
  final_sum_scalar = total_sum;
  cout << "Total sum : " << total_sum << " total_sum assertion is " << (final_sum_scalar == total_sum) << "\n";

  // Assert on final value at the center and the total sum for the other variants
  // that you come up with. We are dealing with doubles.

  delete[] grid1;
  delete[] grid2;

  cout << "\nRunning Method 5 version\n";
  // method 1
  grid1 = new double[TOTAL_SIZE];
  std::fill_n(grid1, TOTAL_SIZE, 0.0);
  grid1[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)] = 100.0;

  grid2 = new double[TOTAL_SIZE];
  std::fill_n(grid2, TOTAL_SIZE, 0.0);
  grid2[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)] = 100.0;
  current_grid = grid1;
  next_grid = grid2;
  start = HR::now();
  for (int t = 0; t < TIMESTEPS; t++)
  {
    stencil_3d_7pt_method5(current_grid, next_grid);
    std::swap(current_grid, next_grid);
  }
  end = HR::now();
  duration = duration_cast<milliseconds>(end - start).count();
  cout << "Scalar kernel time: " << duration << " ms" << endl;

  final = current_grid[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)];
  cout << "Final value at center: " << final << " final scalar assertion is " << ((std::fabs(final_scalar - final) < EPSILON)) << "\n";
  total_sum = 0.0;
  for (size_t i = 0; i < TOTAL_SIZE; i++)
  {
    total_sum += current_grid[i];
  }
  final_sum_scalar = total_sum;
  cout << "Total sum : " << total_sum << " total_sum assertion is " << (final_sum_scalar == total_sum) << "\n";

  // Assert on final value at the center and the total sum for the other variants
  // that you come up with. We are dealing with doubles.

  delete[] grid1;
  delete[] grid2;

  cout << "\nRunning Method 6 version\n";
  // method 1
  grid1 = new double[TOTAL_SIZE];
  std::fill_n(grid1, TOTAL_SIZE, 0.0);
  grid1[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)] = 100.0;

  grid2 = new double[TOTAL_SIZE];
  std::fill_n(grid2, TOTAL_SIZE, 0.0);
  grid2[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)] = 100.0;
  current_grid = grid1;
  next_grid = grid2;
  start = HR::now();
  for (int t = 0; t < TIMESTEPS; t++)
  {
    stencil_3d_7pt_method6(current_grid, next_grid);
    std::swap(current_grid, next_grid);
  }
  end = HR::now();
  duration = duration_cast<milliseconds>(end - start).count();
  cout << "Scalar kernel time: " << duration << " ms" << endl;

  final = current_grid[(NX / 2) * NY * NZ + (NY / 2) * NZ + (NZ / 2)];
  cout << "Final value at center: " << final << " final scalar assertion is " << ((std::fabs(final_scalar - final) < EPSILON)) << "\n";
  total_sum = 0.0;
  for (size_t i = 0; i < TOTAL_SIZE; i++)
  {
    total_sum += current_grid[i];
  }
  final_sum_scalar = total_sum;
  cout << "Total sum : " << total_sum << " total_sum assertion is " << (final_sum_scalar == total_sum) << "\n";

  // Assert on final value at the center and the total sum for the other variants
  // that you come up with. We are dealing with doubles.

  delete[] grid1;
  delete[] grid2;
  return EXIT_SUCCESS;
}
