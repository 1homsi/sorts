#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int isSorted(int *arr, int n) {
    for (int i = 0; i < n - 1; i++) {
        if (arr[i] > arr[i + 1]) return 0;
    }
    return 1;
}

void shuffle(int *arr, int n) {
    for (int i = n - 1; i > 0; i--) {
        int j = rand() % (i + 1);
        int tmp = arr[i]; arr[i] = arr[j]; arr[j] = tmp;
    }
}

__global__ void checkSorted(int *arr, int n, int *result) {
    *result = 1;
    for (int i = 0; i < n - 1; i++) {
        if (arr[i] > arr[i + 1]) { *result = 0; return; }
    }
}

int main() {
    srand(time(NULL));
    int arr[] = {3, 1, 4, 1, 5, 9, 2, 6};
    int n = 8;
    while (!isSorted(arr, n)) shuffle(arr, n);
    for (int i = 0; i < n; i++) printf("%d ", arr[i]);
    printf("\n");
    return 0;
}
