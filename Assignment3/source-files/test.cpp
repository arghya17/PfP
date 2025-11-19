#include <immintrin.h>
#include <iostream>
#include <iomanip>
#include <algorithm>
#include <cassert>
#include <chrono>
#include <climits>
#include <cstdlib>
#include <iostream>
#include <x86intrin.h>

void print_m256i_epi32(__m256i v, const char *name)
{
    alignas(32) int out[8];
    _mm256_store_si256((__m256i *)out, v);
    std::cout << name << " : [";
    for (int i = 0; i < 8; ++i)
    {
        std::cout << out[i];
        if (i != 7)
            std::cout << ", ";
    }
    std::cout << "]\n";
}

int main()
{
    // x = [a,b,c,d,e,f,g,h] -> use numbers 1..8
    int *array = static_cast<int *>(aligned_alloc(32, 8 * sizeof(int)));
    for (int i = 0; i < 8; ++i)
    {
        array[i] = i + 1;
    }
    __m256i x = _mm256_load_si256((__m256i *)&array[0]);
    __m256i zeros = _mm256_setzero_si256();

    print_m256i_epi32(x, "x (orig)");

    // Build x_shift = [e f g h | 0 0 0 0]
    __m256i x_shift = _mm256_permute2x128_si256(x, zeros, 0x21);

    // IMPORTANT: operand order is _mm256_alignr_epi8(a, b, imm8) => temp = [b_lane | a_lane]
    // To get full-256 shift-left-by-8-bytes: use a = x_shift, b = x, imm8 = 8
    __m256i result = _mm256_alignr_epi8(x_shift, x, 4);

    print_m256i_epi32(result, "result (shift-left-by-8 bytes)");

    x_shift = _mm256_permute2x128_si256(zeros, x, 0x21);
    print_m256i_epi32(x_shift, "x_shift");
    // IMPORTANT: operand order is _mm256_alignr_epi8(a, b, imm8) => temp = [b_lane | a_lane]
    // To get full-256 shift-left-by-8-bytes: use a = x_shift, b = x, imm8 = 8
    result = _mm256_alignr_epi8(x_shift, x, 16);

    print_m256i_epi32(result, "result (shift-left-by-16 bytes)");

    print_m256i_epi32(_mm256_alignr_epi8(x, zeros, 16), "x shift-left-by-4 bytes");

    print_m256i_epi32(_mm256_slli_si256(x, 4), "x shift-left-by-4 bytes using slli");

    __m256i shifted = _mm256_permutevar8x32_epi32(x, _mm256_setr_epi32(7, 0, 1, 2, 3, 4, 5, 6));

    // Zero the first element
    const __m256i mask = _mm256_setr_epi32(0x00000000, -1, -1, -1, -1, -1, -1, -1);
    print_m256i_epi32(_mm256_and_si256(shifted, mask), "shifted with zero first element");

    return 0;
}
