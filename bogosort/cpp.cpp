#include <algorithm>
#include <random>
#include <vector>

void bogosort(std::vector<int>& arr) {
    while (!std::is_sorted(arr.begin(), arr.end())) {
        std::shuffle(arr.begin(), arr.end(), std::mt19937(std::random_device()()));
    }
}
