#include <iostream>
#include <vector>
#include <algorithm>

void flip(std::vector<int>& arr, int k) {
    int left = 0, right = k;
    while (left < right) {
        std::swap(arr[left], arr[right]);
        left++; right--;
    }
}

void pancakeSort(std::vector<int>& arr) {
    for (int size = arr.size(); size > 1; size--) {
        int maxIdx = 0;
        for (int i = 1; i < size; i++) {
            if (arr[i] > arr[maxIdx]) maxIdx = i;
        }
        if (maxIdx != size - 1) {
            if (maxIdx != 0) flip(arr, maxIdx);
            flip(arr, size - 1);
        }
    }
}

int main() {
    std::vector<int> arr = {3, 6, 2, 7, 4, 1, 5};
    pancakeSort(arr);
    for (int x : arr) std::cout << x << " ";
    std::cout << std::endl;
    return 0;
}
