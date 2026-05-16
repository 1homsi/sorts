#include <iostream>
#include <vector>
using namespace std;

int partition(vector<int>& arr, int low, int high) {
    int pivot = arr[high], i = low;
    for (int j = low; j < high; j++)
        if (arr[j] <= pivot) swap(arr[i++], arr[j]);
    swap(arr[i], arr[high]);
    return i;
}

void quicksort(vector<int>& arr, int low, int high) {
    if (low < high) {
        int p = partition(arr, low, high);
        quicksort(arr, low, p - 1);
        quicksort(arr, p + 1, high);
    }
}

int main() {
    vector<int> arr = {3, 6, 8, 10, 1, 2, 1};
    quicksort(arr, 0, arr.size() - 1);
    for (int x : arr) cout << x << " ";
    return 0;
}
