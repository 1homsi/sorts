#include <stdio.h>
#include <cuda_runtime.h>

__device__ void compareAndSwap(int* arr, int i, int j, bool direction) {
    if (direction == (arr[i] > arr[j])) {
        int tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
    }
}

__global__ void bitonicMergeStep(int* arr, int lo, int k, bool direction) {
    int i = lo + blockIdx.x * blockDim.x + threadIdx.x;
    if (i < lo + k) {
        compareAndSwap(arr, i, i + k, direction);
    }
}

void bitonicSort(int* d_arr, int n) {
    for (int cnt = 2; cnt <= n; cnt *= 2) {
        for (int sub_cnt = cnt; sub_cnt >= 2; sub_cnt /= 2) {
            int k = sub_cnt / 2;
            for (int lo = 0; lo < n; lo += sub_cnt) {
                bool dir = ((lo / cnt) % 2 == 0);
                dim3 blocks((k + 255) / 256);
                dim3 threads(256);
                bitonicMergeStep<<<blocks, threads>>>(d_arr, lo, k, dir);
            }
        }
    }
    cudaDeviceSynchronize();
}

int main() {
    int h_arr[] = {3, 7, 4, 8, 6, 2, 1, 5};
    int n = 8;
    int* d_arr;
    cudaMalloc(&d_arr, n * sizeof(int));
    cudaMemcpy(d_arr, h_arr, n * sizeof(int), cudaMemcpyHostToDevice);
    bitonicSort(d_arr, n);
    cudaMemcpy(h_arr, d_arr, n * sizeof(int), cudaMemcpyDeviceToHost);
    for (int i = 0; i < n; i++) printf("%d ", h_arr[i]);
    printf("\n");
    cudaFree(d_arr);
    return 0;
}
