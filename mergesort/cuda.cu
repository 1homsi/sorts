#include <stdio.h>
#include <stdlib.h>

void merge(int* arr, int* tmp, int lo, int mid, int hi) {
    int i = lo, j = mid + 1, k = lo;
    while (i <= mid && j <= hi) {
        if (arr[i] <= arr[j]) tmp[k++] = arr[i++];
        else tmp[k++] = arr[j++];
    }
    while (i <= mid) tmp[k++] = arr[i++];
    while (j <= hi) tmp[k++] = arr[j++];
    for (int x = lo; x <= hi; x++) arr[x] = tmp[x];
}

void mergeSort(int* arr, int* tmp, int lo, int hi) {
    if (lo >= hi) return;
    int mid = (lo + hi) / 2;
    mergeSort(arr, tmp, lo, mid);
    mergeSort(arr, tmp, mid + 1, hi);
    merge(arr, tmp, lo, mid, hi);
}

int main() {
    int arr[] = {38, 27, 43, 3, 9, 82, 10};
    int n = 7;
    int* tmp = (int*)malloc(n * sizeof(int));
    mergeSort(arr, tmp, 0, n - 1);
    for (int i = 0; i < n; i++) printf("%d ", arr[i]);
    printf("\n");
    free(tmp);
    return 0;
}
