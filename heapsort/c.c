#include <stdio.h>

void heapify(int arr[], int n, int i) {
    int largest = i, left = 2*i+1, right = 2*i+2, tmp;
    if (left < n && arr[left] > arr[largest]) largest = left;
    if (right < n && arr[right] > arr[largest]) largest = right;
    if (largest != i) {
        tmp = arr[i]; arr[i] = arr[largest]; arr[largest] = tmp;
        heapify(arr, n, largest);
    }
}

void heapsort(int arr[], int n) {
    int i, tmp;
    for (i = n/2 - 1; i >= 0; i--) heapify(arr, n, i);
    for (i = n - 1; i > 0; i--) {
        tmp = arr[0]; arr[0] = arr[i]; arr[i] = tmp;
        heapify(arr, i, 0);
    }
}

int main() {
    int arr[] = {12, 11, 13, 5, 6, 7};
    int n = sizeof(arr) / sizeof(arr[0]);
    heapsort(arr, n);
    for (int i = 0; i < n; i++) printf("%d ", arr[i]);
    printf("\n");
    return 0;
}
