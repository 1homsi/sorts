#include <stdio.h>
#include <stdlib.h>
#include <string.h>

__global__ void countingKernel(int *arr, int *count, int n, int exp) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) atomicAdd(&count[(arr[i] / exp) % 10], 1);
}

void countingSort(int *arr, int n, int exp) {
    int *output = (int*)malloc(n * sizeof(int));
    int count[10] = {0};
    for (int i = 0; i < n; i++) count[(arr[i] / exp) % 10]++;
    for (int i = 1; i < 10; i++) count[i] += count[i - 1];
    for (int i = n - 1; i >= 0; i--) {
        int idx = (arr[i] / exp) % 10;
        output[--count[idx]] = arr[i];
    }
    memcpy(arr, output, n * sizeof(int));
    free(output);
}

void radixSort(int *arr, int n) {
    if (n == 0) return;
    int max = arr[0];
    for (int i = 1; i < n; i++) if (arr[i] > max) max = arr[i];
    for (int exp = 1; max / exp > 0; exp *= 10) countingSort(arr, n, exp);
}

int main() {
    int arr[] = {170, 45, 75, 90, 802, 24, 2, 66};
    int n = 8;
    radixSort(arr, n);
    for (int i = 0; i < n; i++) printf("%d ", arr[i]);
    printf("\n");
    return 0;
}
