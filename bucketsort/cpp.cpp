#include <iostream>
#include <vector>
#include <algorithm>

void insertionSort(std::vector<double>& bucket) {
    for (int i = 1; i < (int)bucket.size(); i++) {
        double key = bucket[i];
        int j = i - 1;
        while (j >= 0 && bucket[j] > key) {
            bucket[j + 1] = bucket[j];
            j--;
        }
        bucket[j + 1] = key;
    }
}

std::vector<double> bucketSort(std::vector<double> arr) {
    int n = arr.size();
    if (n == 0) return arr;
    double min = *std::min_element(arr.begin(), arr.end());
    double max = *std::max_element(arr.begin(), arr.end());
    std::vector<std::vector<double>> buckets(n);
    for (double num : arr) {
        int idx = (int)((num - min) / (max - min + 1.0) * n);
        if (idx >= n) idx = n - 1;
        buckets[idx].push_back(num);
    }
    std::vector<double> result;
    for (auto& bucket : buckets) {
        insertionSort(bucket);
        result.insert(result.end(), bucket.begin(), bucket.end());
    }
    return result;
}

int main() {
    std::vector<double> data = {0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68};
    auto sorted = bucketSort(data);
    for (double v : sorted) std::cout << v << " ";
    std::cout << std::endl;
    return 0;
}
