#include <stdio.h>

void flip(int arr[], int k) {
    int left = 0, right = k, tmp;
    while (left < right) {
        tmp = arr[left];
        arr[left] = arr[right];
        arr[right] = tmp;
        left++; right--;
    }
}

void pancakeSort(int arr[], int n) {
    for (int size = n; size > 1; size--) {
        int maxIdx = 0;
        for (int i = 1; i < size; i++) {
            if (arr[i] > arr[maxIdx]) maxIdx = i;
        }
        if (maxIdx != size - 1) {
            if (maxIdx != 0) flip(arr, maxIdx);
            flip(arr, size - 1);
        }
    }
}

int main() {
    int arr[] = {3, 6, 2, 7, 4, 1, 5};
    int n = 7;
    pancakeSort(arr, n);
    for (int i = 0; i < n; i++) printf("%d ", arr[i]);
    printf("\n");
    return 0;
}
