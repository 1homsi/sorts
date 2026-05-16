#include <iostream>
#include <vector>
#include <algorithm>
#include <random>

bool isSorted(const std::vector<int>& arr) {
    for (size_t i = 0; i < arr.size() - 1; i++) {
        if (arr[i] > arr[i + 1]) return false;
    }
    return true;
}

void bogosort(std::vector<int>& arr) {
    std::random_device rd;
    std::mt19937 g(rd());
    while (!isSorted(arr)) {
        std::shuffle(arr.begin(), arr.end(), g);
    }
}

int main() {
    std::vector<int> arr = {3, 1, 4, 1, 5, 9, 2, 6};
    bogosort(arr);
    for (int v : arr) std::cout << v << " ";
    std::cout << std::endl;
    return 0;
}
