#include <vector>
#include <algorithm>

void combSort(std::vector<int>& arr) {
    int n = arr.size();
    int gap = n;
    double shrink = 1.3;
    bool sorted = false;
    while (!sorted) {
        gap = static_cast<int>(gap / shrink);
        if (gap <= 1) {
            gap = 1;
            sorted = true;
        }
        for (int i = 0; i + gap < n; i++) {
            if (arr[i] > arr[i + gap]) {
                std::swap(arr[i], arr[i + gap]);
                sorted = false;
            }
        }
    }
}
