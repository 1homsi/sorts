#include <stdio.h>

__device__ void flip(int* arr, int k) {
    int left = 0, right = k, tmp;
    while (left < right) {
        tmp = arr[left]; arr[left] = arr[right]; arr[right] = tmp;
        left++; right--;
    }
}

__device__ int findMaxIdx(int* arr, int size) {
    int maxIdx = 0;
    for (int i = 1; i < size; i++) {
        if (arr[i] > arr[maxIdx]) maxIdx = i;
    }
    return maxIdx;
}

__global__ void pancakeSortKernel(int* arr, int n) {
    for (int size = n; size > 1; size--) {
        int maxIdx = findMaxIdx(arr, size);
        if (maxIdx != size - 1) {
            if (maxIdx != 0) flip(arr, maxIdx);
            flip(arr, size - 1);
        }
    }
}

int main() {
    int h_arr[] = {3, 6, 2, 7, 4, 1, 5};
    int n = 7;
    int* d_arr;
    cudaMalloc(&d_arr, n * sizeof(int));
    cudaMemcpy(d_arr, h_arr, n * sizeof(int), cudaMemcpyHostToDevice);
    pancakeSortKernel<<<1, 1>>>(d_arr, n);
    cudaMemcpy(h_arr, d_arr, n * sizeof(int), cudaMemcpyDeviceToHost);
    for (int i = 0; i < n; i++) printf("%d ", h_arr[i]);
    printf("\n");
    cudaFree(d_arr);
    return 0;
}
