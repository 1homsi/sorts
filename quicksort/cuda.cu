#include <stdio.h>
#include <cuda_runtime.h>

__device__ void swap(int *a, int *b) { int t = *a; *a = *b; *b = t; }

__device__ int partition(int *arr, int low, int high) {
    int pivot = arr[high], i = low;
    for (int j = low; j < high; j++)
        if (arr[j] <= pivot) swap(&arr[i++], &arr[j]);
    swap(&arr[i], &arr[high]);
    return i;
}

__device__ void quicksort_device(int *arr, int low, int high) {
    int stack[64];
    int sp = -1;
    stack[++sp] = low;
    stack[++sp] = high;
    while (sp >= 0) {
        high = stack[sp--];
        low = stack[sp--];
        if (low < high) {
            int p = partition(arr, low, high);
            stack[++sp] = low; stack[++sp] = p - 1;
            stack[++sp] = p + 1; stack[++sp] = high;
        }
    }
}

__global__ void quicksort_kernel(int *arr, int n) {
    if (threadIdx.x == 0 && blockIdx.x == 0)
        quicksort_device(arr, 0, n - 1);
}

int main() {
    int h[] = {3, 6, 8, 10, 1, 2, 1};
    int n = 7, *d;
    cudaMalloc(&d, n * sizeof(int));
    cudaMemcpy(d, h, n * sizeof(int), cudaMemcpyHostToDevice);
    quicksort_kernel<<<1, 1>>>(d, n);
    cudaMemcpy(h, d, n * sizeof(int), cudaMemcpyDeviceToHost);
    for (int i = 0; i < n; i++) printf("%d ", h[i]);
    cudaFree(d);
    return 0;
}
