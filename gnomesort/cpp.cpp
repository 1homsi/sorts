#include <vector>
#include <algorithm>

void gnomeSort(std::vector<int>& arr) {
    int i = 0;
    while (i < static_cast<int>(arr.size())) {
        if (i == 0 || arr[i] >= arr[i - 1]) {
            i++;
        } else {
            std::swap(arr[i], arr[i - 1]);
            i--;
        }
    }
}
