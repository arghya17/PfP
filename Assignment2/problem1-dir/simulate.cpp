#include <iostream>
#include <vector>
#include <algorithm>
#include <cstdlib>
#include <bits/stdc++.h>
using namespace std;
int main()
{
    std::vector<int> nums;
    for (int i = 1; i <= 16; ++i)
    {
        nums.push_back(i);
    }

    // Generate all permutations of 3 different numbers
    for (int p = 1; p <= 5; p++)
    {
        for (size_t i = 1; i < nums.size(); ++i)
        {
            for (size_t j = 1; j < nums.size(); ++j)
            {
                for (size_t k = 1; k < nums.size(); ++k)
                {
                    // Call ./convolution.out with these 3 numbers
                    std::string cmd = "./convolution.out " +
                                      std::to_string(nums[i]) + " " +
                                      std::to_string(nums[j]) + " " +
                                      std::to_string(nums[k]);
                    std::system(cmd.c_str());
                    sleep(1);
                }
            }
        }
    }
    return 0;
}