#include <stdio.h>
#include <cuda_runtime.h>

__device__ void insertionSort(float* bucket, int n) {
    for (int i = 1; i < n; i++) {
        float key = bucket[i];
        int j = i - 1;
        while (j >= 0 && bucket[j] > key) {
            bucket[j + 1] = bucket[j];
            j--;
        }
        bucket[j + 1] = key;
    }
}

__global__ void bucketSortKernel(float* arr, float* result, int n, float minV, float maxV) {
    __shared__ float buckets[10][10];
    __shared__ int counts[10];
    if (threadIdx.x == 0) {
        for (int i = 0; i < n; i++) counts[i] = 0;
        for (int i = 0; i < n; i++) {
            int idx = (int)((arr[i] - minV) / (maxV - minV + 1.0f) * n);
            if (idx >= n) idx = n - 1;
            buckets[idx][counts[idx]++] = arr[i];
        }
        int pos = 0;
        for (int b = 0; b < n; b++) {
            insertionSort(buckets[b], counts[b]);
            for (int i = 0; i < counts[b]; i++) result[pos++] = buckets[b][i];
        }
    }
}

int main() {
    float h_arr[] = {0.78f, 0.17f, 0.39f, 0.26f, 0.72f, 0.94f, 0.21f, 0.12f, 0.23f, 0.68f};
    int n = 10;
    float minV = 0.12f, maxV = 0.94f;
    float *d_arr, *d_result;
    cudaMalloc(&d_arr, n * sizeof(float));
    cudaMalloc(&d_result, n * sizeof(float));
    cudaMemcpy(d_arr, h_arr, n * sizeof(float), cudaMemcpyHostToDevice);
    bucketSortKernel<<<1, 1>>>(d_arr, d_result, n, minV, maxV);
    float h_result[10];
    cudaMemcpy(h_result, d_result, n * sizeof(float), cudaMemcpyDeviceToHost);
    for (int i = 0; i < n; i++) printf("%.2f ", h_result[i]);
    printf("\n");
    cudaFree(d_arr); cudaFree(d_result);
    return 0;
}
