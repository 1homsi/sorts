#include <stdio.h>
#include <stdbool.h>

void compareAndSwap(int *arr, int i, int j, bool direction) {
    if (direction == (arr[i] > arr[j])) {
        int tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
    }
}

void bitonicMerge(int *arr, int lo, int cnt, bool direction) {
    if (cnt > 1) {
        int k = cnt / 2;
        for (int i = lo; i < lo + k; i++) {
            compareAndSwap(arr, i, i + k, direction);
        }
        bitonicMerge(arr, lo, k, direction);
        bitonicMerge(arr, lo + k, k, direction);
    }
}

void bitonicSort(int *arr, int lo, int cnt, bool direction) {
    if (cnt > 1) {
        int k = cnt / 2;
        bitonicSort(arr, lo, k, true);
        bitonicSort(arr, lo + k, k, false);
        bitonicMerge(arr, lo, cnt, direction);
    }
}

int main() {
    int data[] = {3, 7, 4, 8, 6, 2, 1, 5};
    int n = 8;
    bitonicSort(data, 0, n, true);
    for (int i = 0; i < n; i++) printf("%d ", data[i]);
    printf("\n");
    return 0;
}
