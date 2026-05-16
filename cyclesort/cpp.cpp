#include <iostream>
#include <vector>

int cycleSort(std::vector<int>& arr) {
    int writes = 0;
    int n = arr.size();
    for (int cycleStart = 0; cycleStart < n - 1; cycleStart++) {
        int item = arr[cycleStart];
        int pos = cycleStart;
        for (int i = cycleStart + 1; i < n; i++) {
            if (arr[i] < item) pos++;
        }
        if (pos == cycleStart) continue;
        while (item == arr[pos]) pos++;
        std::swap(arr[pos], item);
        writes++;
        while (pos != cycleStart) {
            pos = cycleStart;
            for (int i = cycleStart + 1; i < n; i++) {
                if (arr[i] < item) pos++;
            }
            while (item == arr[pos]) pos++;
            std::swap(arr[pos], item);
            writes++;
        }
    }
    return writes;
}

int main() {
    std::vector<int> arr = {5, 4, 3, 2, 1};
    cycleSort(arr);
    for (int x : arr) std::cout << x << " ";
    std::cout << std::endl;
    return 0;
}
