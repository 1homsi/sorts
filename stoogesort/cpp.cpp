#include <iostream>
#include <vector>

void stoogeSort(std::vector<int>& arr, int first, int last) {
    if (arr[first] > arr[last]) {
        std::swap(arr[first], arr[last]);
    }
    if (last - first + 1 > 2) {
        int t = (last - first + 1) * 2 / 3;
        stoogeSort(arr, first, first + t - 1);
        stoogeSort(arr, last - t + 1, last);
        stoogeSort(arr, first, first + t - 1);
    }
}

int main() {
    std::vector<int> arr = {3, 1, 4, 1, 5, 9, 2, 6};
    stoogeSort(arr, 0, arr.size() - 1);
    for (int x : arr) std::cout << x << " ";
    std::cout << std::endl;
    return 0;
}
