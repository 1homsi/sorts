#include <iostream>
#include <vector>
using namespace std;

void compareAndSwap(vector<int>& arr, int i, int j, bool direction) {
    if (direction == (arr[i] > arr[j])) {
        swap(arr[i], arr[j]);
    }
}

void bitonicMerge(vector<int>& arr, int lo, int cnt, bool direction) {
    if (cnt > 1) {
        int k = cnt / 2;
        for (int i = lo; i < lo + k; i++) {
            compareAndSwap(arr, i, i + k, direction);
        }
        bitonicMerge(arr, lo, k, direction);
        bitonicMerge(arr, lo + k, k, direction);
    }
}

void bitonicSort(vector<int>& arr, int lo, int cnt, bool direction) {
    if (cnt > 1) {
        int k = cnt / 2;
        bitonicSort(arr, lo, k, true);
        bitonicSort(arr, lo + k, k, false);
        bitonicMerge(arr, lo, cnt, direction);
    }
}

int main() {
    vector<int> data = {3, 7, 4, 8, 6, 2, 1, 5};
    bitonicSort(data, 0, data.size(), true);
    for (int x : data) cout << x << " ";
    cout << endl;
    return 0;
}
