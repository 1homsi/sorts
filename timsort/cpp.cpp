#include <iostream>
#include <vector>
#include <algorithm>

const int MIN_RUN = 32;

void insertionSort(std::vector<int>& arr, int left, int right) {
    for (int i = left + 1; i <= right; i++) {
        int key = arr[i];
        int j = i - 1;
        while (j >= left && arr[j] > key) {
            arr[j + 1] = arr[j];
            j--;
        }
        arr[j + 1] = key;
    }
}

void merge(std::vector<int>& arr, int left, int mid, int right) {
    std::vector<int> leftPart(arr.begin() + left, arr.begin() + mid + 1);
    std::vector<int> rightPart(arr.begin() + mid + 1, arr.begin() + right + 1);
    int i = 0, j = 0, k = left;
    while (i < (int)leftPart.size() && j < (int)rightPart.size()) {
        if (leftPart[i] <= rightPart[j]) arr[k++] = leftPart[i++];
        else arr[k++] = rightPart[j++];
    }
    while (i < (int)leftPart.size()) arr[k++] = leftPart[i++];
    while (j < (int)rightPart.size()) arr[k++] = rightPart[j++];
}

void timsort(std::vector<int>& arr) {
    int n = arr.size();
    for (int i = 0; i < n; i += MIN_RUN) {
        insertionSort(arr, i, std::min(i + MIN_RUN - 1, n - 1));
    }
    for (int size = MIN_RUN; size < n; size *= 2) {
        for (int left = 0; left < n; left += 2 * size) {
            int mid = std::min(left + size - 1, n - 1);
            int right = std::min(left + 2 * size - 1, n - 1);
            if (mid < right) merge(arr, left, mid, right);
        }
    }
}

int main() {
    std::vector<int> arr = {5, 2, 8, 1, 9, 3, 7, 4, 6};
    timsort(arr);
    for (int x : arr) std::cout << x << " ";
    std::cout << std::endl;
    return 0;
}
