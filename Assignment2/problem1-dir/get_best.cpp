#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <map>
#include <vector>
#include <algorithm>

using namespace std;

int main() {
    const string inputFilePath = "./problem1-dir/result_with_diff.txt";
    ifstream inputFile(inputFilePath);

    if (!inputFile.is_open()) {
        cerr << "Failed to open input file: " << inputFilePath << endl;
        return 1;
    }

    string line;
    bool isHeader = true;

    // Map to count "yes" per B1,B2,B3 combination
    map<string, int> yesCounts;

    while (getline(inputFile, line)) {
        if (isHeader) {
            isHeader = false;  // Skip header
            continue;
        }

        istringstream iss(line);
        int B1, B2, B3;
        string token;
        vector<string> tokens;

        // Split the line into tokens
        while (getline(iss, token, '\t')) {
            tokens.push_back(token);
        }

        if (tokens.size() < 13) continue;  // Sanity check

        B1 = stoi(tokens[0]);
        B2 = stoi(tokens[1]);
        B3 = stoi(tokens[2]);
        string result = tokens[12];  // "yes" or "no"

        if (result == "yes") {
            string key = to_string(B1) + "," + to_string(B2) + "," + to_string(B3);
            yesCounts[key]++;
        }
    }

    inputFile.close();

    // Move to vector for sorting
    vector<pair<string, int>> sortedYesCounts(yesCounts.begin(), yesCounts.end());

    // Sort descending by count
    sort(sortedYesCounts.begin(), sortedYesCounts.end(),
        [](const auto& a, const auto& b) {
            return a.second > b.second;
        });

    // Print results
    cout << "Combinations with at least one 'yes', sorted by count:\n";
    for (const auto& [combo, count] : sortedYesCounts) {
        cout << "B1,B2,B3: " << combo << " -> " << count << " yes(es)" << endl;
    }

    return 0;
}

