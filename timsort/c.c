#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MIN_RUN 32

void insertion_sort(int *arr, int left, int right) {
    for (int i = left + 1; i <= right; i++) {
        int key = arr[i];
        int j = i - 1;
        while (j >= left && arr[j] > key) {
            arr[j + 1] = arr[j];
            j--;
        }
        arr[j + 1] = key;
    }
}

void merge(int *arr, int left, int mid, int right) {
    int ln = mid - left + 1, rn = right - mid;
    int *lp = malloc(ln * sizeof(int));
    int *rp = malloc(rn * sizeof(int));
    memcpy(lp, arr + left, ln * sizeof(int));
    memcpy(rp, arr + mid + 1, rn * sizeof(int));
    int i = 0, j = 0, k = left;
    while (i < ln && j < rn) {
        if (lp[i] <= rp[j]) arr[k++] = lp[i++];
        else arr[k++] = rp[j++];
    }
    while (i < ln) arr[k++] = lp[i++];
    while (j < rn) arr[k++] = rp[j++];
    free(lp);
    free(rp);
}

void timsort(int *arr, int n) {
    for (int i = 0; i < n; i += MIN_RUN) {
        int right = i + MIN_RUN - 1;
        if (right >= n) right = n - 1;
        insertion_sort(arr, i, right);
    }
    for (int size = MIN_RUN; size < n; size *= 2) {
        for (int left = 0; left < n; left += 2 * size) {
            int mid = left + size - 1;
            if (mid >= n) mid = n - 1;
            int right = left + 2 * size - 1;
            if (right >= n) right = n - 1;
            if (mid < right) merge(arr, left, mid, right);
        }
    }
}

int main() {
    int arr[] = {5, 2, 8, 1, 9, 3, 7, 4, 6};
    int n = sizeof(arr) / sizeof(arr[0]);
    timsort(arr, n);
    for (int i = 0; i < n; i++) printf("%d ", arr[i]);
    printf("\n");
    return 0;
}
