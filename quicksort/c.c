#include <stdio.h>

void swap(int *a, int *b) { int t = *a; *a = *b; *b = t; }

int partition(int arr[], int low, int high) {
    int pivot = arr[high], i = low;
    for (int j = low; j < high; j++)
        if (arr[j] <= pivot) swap(&arr[i++], &arr[j]);
    swap(&arr[i], &arr[high]);
    return i;
}

void quicksort(int arr[], int low, int high) {
    if (low < high) {
        int p = partition(arr, low, high);
        quicksort(arr, low, p - 1);
        quicksort(arr, p + 1, high);
    }
}

int main() {
    int arr[] = {3, 6, 8, 10, 1, 2, 1};
    int n = 7;
    quicksort(arr, 0, n - 1);
    for (int i = 0; i < n; i++) printf("%d ", arr[i]);
    return 0;
}
