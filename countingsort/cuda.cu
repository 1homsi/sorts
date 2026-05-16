#include <stdio.h>
#include <cuda_runtime.h>

__global__ void countOccurrences(int *arr, int *count, int n, int minVal) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) atomicAdd(&count[arr[i] - minVal], 1);
}

void countingSort(int *arr, int n) {
    int min = arr[0], max = arr[0];
    for (int i = 1; i < n; i++) {
        if (arr[i] < min) min = arr[i];
        if (arr[i] > max) max = arr[i];
    }
    int range = max - min + 1;
    int *count = (int *)calloc(range, sizeof(int));
    int *output = (int *)malloc(n * sizeof(int));
    for (int i = 0; i < n; i++) count[arr[i] - min]++;
    for (int i = 1; i < range; i++) count[i] += count[i - 1];
    for (int i = n - 1; i >= 0; i--) output[--count[arr[i] - min]] = arr[i];
    for (int i = 0; i < n; i++) arr[i] = output[i];
    free(count); free(output);
}

int main() {
    int arr[] = {4, 2, 2, 8, 3, 3, 1};
    countingSort(arr, 7);
    for (int i = 0; i < 7; i++) printf("%d ", arr[i]);
    printf("
");
    return 0;
}
