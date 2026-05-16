#include <stdio.h>

void merge(int arr[], int left, int mid, int right) {
  int i = left, j = mid + 1, k = 0;
  int result[right - left + 1];
  
  while (i <= mid && j <= right) {
    if (arr[i] <= arr[j]) {
      result[k++] = arr[i++];
    } else {
      result[k++] = arr[j++];
    }
  }
  
  while (i <= mid) result[k++] = arr[i++];
  while (j <= right) result[k++] = arr[j++];
  
  for (k = 0; k < (right - left + 1); k++) {
    arr[left + k] = result[k];
  }
}

void mergesort(int arr[], int left, int right) {
  if (left < right) {
    int mid = (left + right) / 2;
    mergesort(arr, left, mid);
    mergesort(arr, mid + 1, right);
    merge(arr, left, mid, right);
  }
}

main() {
  int arr[] = {5, 2, 8, 1, 9, 3};
  mergesort(arr, 0, 5);
  printf("%d %d %d %d %d %d\n", arr[0], arr[1], arr[2], arr[3], arr[4], arr[5]);
}
