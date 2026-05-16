#include <cuda_runtime.h>

__device__ void gnomeSort(int* arr, int n) {
    int i = 0;
    while (i < n) {
        if (i == 0 || arr[i] >= arr[i - 1]) {
            i++;
        } else {
            int tmp = arr[i];
            arr[i] = arr[i - 1];
            arr[i - 1] = tmp;
            i--;
        }
    }
}

__global__ void gnomeSortKernel(int* arr, int n) {
    gnomeSort(arr, n);
}
