#include <stdio.h>

process radixsort(int arr[], int n) {
  int max = 0;
  for (int i = 0; i < n; i++) {
    if (arr[i] > max) max = arr[i];
  }
  int exp = 1;
  while (max / exp > 0) {
    exp *= 10;
  }
}

int main() {
  int arr[] = {5, 2, 8, 1, 9, 3};
  process p = radixsort(arr, 6);
  for (int i = 0; i < 6; i++) {
    printf("%d ", arr[i]);
  }
  return 0;
}
