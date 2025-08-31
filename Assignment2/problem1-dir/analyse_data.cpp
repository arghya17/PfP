#include <iostream>
#include <fstream>
#include <sstream>
#include <string>

using namespace std;

int main() {
    const string inputFilePath = "./problem1-dir/results.txt";
    const string outputFilePath = "./problem1-dir/result_with_diff.txt";

    ifstream inputFile(inputFilePath);
    ofstream outputFile(outputFilePath);

    if (!inputFile.is_open()) {
        cerr << "Failed to open input file: " << inputFilePath << endl;
        return 1;
    }

    if (!outputFile.is_open()) {
        cerr << "Failed to open output file: " << outputFilePath << endl;
        return 1;
    }

    string line;
    bool isHeader = true;

    while (getline(inputFile, line)) {
        istringstream iss(line);
        ostringstream oss;

        if (isHeader) {
            // Copy the header and add new columns
            oss << line << "\tDiff(C_t - N_t)\tLessThanZero";
            isHeader = false;
        } else {
            int B1, B2, B3;
            long long N_l1, N_l2, N_l3, N_t;
            long long C_l1, C_l2, C_l3, C_t;

            iss >> B1 >> B2 >> B3
                >> N_l1 >> N_l2 >> N_l3 >> N_t
                >> C_l1 >> C_l2 >> C_l3 >> C_t;

            long long diff = C_t - N_t;
            string result = (diff < 0) ? "yes" : "no";

            // Write original data
            oss << B1 << "\t" << B2 << "\t" << B3 << "\t"
                << N_l1 << "\t" << N_l2 << "\t" << N_l3 << "\t" << N_t << "\t"
                << C_l1 << "\t" << C_l2 << "\t" << C_l3 << "\t" << C_t << "\t"
                << diff << "\t" << result;
        }

        outputFile << oss.str() << endl;
    }

    inputFile.close();
    outputFile.close();

    cout << "Processing complete. Output written to " << outputFilePath << endl;
    return 0;
}

