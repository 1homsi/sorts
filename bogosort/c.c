#include <stdbool.h>

bool isSorted(int* arr, int n) {
    for (int i = 0; i < n - 1; i++) {
        if (arr[i] > arr[i + 1]) return false;
    }
    return true;
}

void bogosort(int* arr, int n) {
    while (!isSorted(arr, n)) {
        for (int i = n - 1; i > 0; i--) {
            int j = rand() % (i + 1);
            int tmp = arr[i];
            arr[i] = arr[j];
            arr[j] = tmp;
        }
    }
}
