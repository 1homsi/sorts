#include <stdio.h>

void stoogeSort(int arr[], int first, int last) {
    if (arr[first] > arr[last]) {
        int tmp = arr[first];
        arr[first] = arr[last];
        arr[last] = tmp;
    }
    if (last - first + 1 > 2) {
        int t = (last - first + 1) * 2 / 3;
        stoogeSort(arr, first, first + t - 1);
        stoogeSort(arr, last - t + 1, last);
        stoogeSort(arr, first, first + t - 1);
    }
}

int main() {
    int arr[] = {3, 1, 4, 1, 5, 9, 2, 6};
    int n = 8;
    stoogeSort(arr, 0, n - 1);
    for (int i = 0; i < n; i++) printf("%d ", arr[i]);
    printf("\n");
    return 0;
}
