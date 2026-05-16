#include <cuda_runtime.h>
#include <stdio.h>

__host__ void combSort(int* arr, int n) {
    int gap = n;
    double shrink = 1.3;
    bool sorted = false;
    while (!sorted) {
        gap = (int)(gap / shrink);
        if (gap <= 1) {
            gap = 1;
            sorted = true;
        }
        for (int i = 0; i + gap < n; i++) {
            if (arr[i] > arr[i + gap]) {
                int tmp = arr[i];
                arr[i] = arr[i + gap];
                arr[i + gap] = tmp;
                sorted = false;
            }
        }
    }
}
