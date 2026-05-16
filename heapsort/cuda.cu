#include <stdio.h>

__device__ void heapify(int* arr, int n, int i) {
    int largest = i, left = 2*i+1, right = 2*i+2, tmp;
    if (left < n && arr[left] > arr[largest]) largest = left;
    if (right < n && arr[right] > arr[largest]) largest = right;
    if (largest != i) {
        tmp = arr[i]; arr[i] = arr[largest]; arr[largest] = tmp;
        heapify(arr, n, largest);
    }
}

__global__ void heapsort_kernel(int* arr, int n) {
    for (int i = n/2-1; i >= 0; i--) heapify(arr, n, i);
    for (int i = n-1; i > 0; i--) {
        int tmp = arr[0]; arr[0] = arr[i]; arr[i] = tmp;
        heapify(arr, i, 0);
    }
}

int main() {
    int h_arr[] = {12, 11, 13, 5, 6, 7};
    int n = 6;
    int* d_arr;
    cudaMalloc(&d_arr, n * sizeof(int));
    cudaMemcpy(d_arr, h_arr, n * sizeof(int), cudaMemcpyHostToDevice);
    heapsort_kernel<<<1, 1>>>(d_arr, n);
    cudaMemcpy(h_arr, d_arr, n * sizeof(int), cudaMemcpyDeviceToHost);
    cudaFree(d_arr);
    for (int i = 0; i < n; i++) printf("%d ", h_arr[i]);
    printf("\n");
    return 0;
}
