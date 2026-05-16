#include <stdio.h>

__device__ void cycleSort(int *arr, int n) {
    for (int cycleStart = 0; cycleStart < n - 1; cycleStart++) {
        int item = arr[cycleStart];
        int pos = cycleStart;
        for (int i = cycleStart + 1; i < n; i++) {
            if (arr[i] < item) pos++;
        }
        if (pos == cycleStart) continue;
        while (item == arr[pos]) pos++;
        int tmp = arr[pos]; arr[pos] = item; item = tmp;
        while (pos != cycleStart) {
            pos = cycleStart;
            for (int i = cycleStart + 1; i < n; i++) {
                if (arr[i] < item) pos++;
            }
            while (item == arr[pos]) pos++;
            tmp = arr[pos]; arr[pos] = item; item = tmp;
        }
    }
}

__global__ void sortKernel(int *arr, int n) {
    cycleSort(arr, n);
}

int main() {
    int h_arr[] = {5, 4, 3, 2, 1};
    int n = 5;
    int *d_arr;
    cudaMalloc(&d_arr, n * sizeof(int));
    cudaMemcpy(d_arr, h_arr, n * sizeof(int), cudaMemcpyHostToDevice);
    sortKernel<<<1, 1>>>(d_arr, n);
    cudaMemcpy(h_arr, d_arr, n * sizeof(int), cudaMemcpyDeviceToHost);
    cudaFree(d_arr);
    for (int i = 0; i < n; i++) printf("%d ", h_arr[i]);
    printf("\n");
    return 0;
}
