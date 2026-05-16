#include <cuda_runtime.h>

__device__ void cocktailSort(int* arr, int n) {
    bool swapped = true;
    int start = 0;
    int end = n - 1;
    int tmp;
    while (swapped) {
        swapped = false;
        for (int i = start; i < end; i++) {
            if (arr[i] > arr[i + 1]) {
                tmp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = tmp;
                swapped = true;
            }
        }
        if (!swapped) break;
        swapped = false;
        end--;
        for (int i = end - 1; i >= start; i--) {
            if (arr[i] > arr[i + 1]) {
                tmp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = tmp;
                swapped = true;
            }
        }
        start++;
    }
}

__global__ void sortKernel(int* arr, int n) {
    cocktailSort(arr, n);
}
