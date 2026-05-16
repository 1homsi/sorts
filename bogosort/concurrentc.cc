#include <stdio.h>
#include <stdlib.h>

void bogosort(int *arr, int n) {
  int sorted = 0;
  while (!sorted) {
    sorted = 1;
    for (int i = 0; i < n - 1; i++) {
      if (arr[i] > arr[i+1]) {
        sorted = 0;
        break;
      }
    }
    if (!sorted) {
      for (int i = 0; i < n; i++) {
        int j = rand() % n;
        int tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
      }
    }
  }
}

void main() {
  int arr[] = {3, 1, 2};
  bogosort(arr, 3);
  for (int i = 0; i < 3; i++) {
    printf("%d ", arr[i]);
  }
}
