#include <stdio.h>

__device__ void stoogeSort(int* arr, int first, int last) {
    if (arr[first] > arr[last]) {
        int tmp = arr[first];
        arr[first] = arr[last];
        arr[last] = tmp;
    }
    int n = last - first + 1;
    if (n > 2) {
        int t = n * 2 / 3;
        stoogeSort(arr, first, first + t - 1);
        stoogeSort(arr, last - t + 1, last);
        stoogeSort(arr, first, first + t - 1);
    }
}

__global__ void sortKernel(int* arr, int n) {
    stoogeSort(arr, 0, n - 1);
}

int main() {
    int h_arr[] = {3, 1, 4, 1, 5, 9, 2, 6};
    int n = 8;
    int* d_arr;
    cudaMalloc(&d_arr, n * sizeof(int));
    cudaMemcpy(d_arr, h_arr, n * sizeof(int), cudaMemcpyHostToDevice);
    sortKernel<<<1, 1>>>(d_arr, n);
    cudaMemcpy(h_arr, d_arr, n * sizeof(int), cudaMemcpyDeviceToHost);
    for (int i = 0; i < n; i++) printf("%d ", h_arr[i]);
    printf("\n");
    cudaFree(d_arr);
    return 0;
}
