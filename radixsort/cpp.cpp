#include <iostream>
#include <vector>
#include <algorithm>

void countingSort(std::vector<int>& arr, int exp) {
    int n = arr.size();
    std::vector<int> output(n);
    int count[10] = {0};
    for (int i = 0; i < n; i++) count[(arr[i] / exp) % 10]++;
    for (int i = 1; i < 10; i++) count[i] += count[i - 1];
    for (int i = n - 1; i >= 0; i--) {
        int idx = (arr[i] / exp) % 10;
        output[--count[idx]] = arr[i];
    }
    arr = output;
}

void radixSort(std::vector<int>& arr) {
    if (arr.empty()) return;
    int max = *std::max_element(arr.begin(), arr.end());
    for (int exp = 1; max / exp > 0; exp *= 10) countingSort(arr, exp);
}

int main() {
    std::vector<int> arr = {170, 45, 75, 90, 802, 24, 2, 66};
    radixSort(arr);
    for (int x : arr) std::cout << x << " ";
    std::cout << std::endl;
    return 0;
}
