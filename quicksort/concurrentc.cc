#include <stdio.h>

process quicksort_process(int arr[], int n) {
  int pivot, i, j, temp;

  if (n <= 1) return;

  pivot = arr[0];
  i = 1;
  j = n;

  while (i < j) {
    while (arr[i] < pivot) i++;
    while (arr[j] > pivot) j--;
    if (i < j) {
      temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
      i++;
      j--;
    }
  }
}

void main() {
  int arr[6] = {5, 2, 8, 1, 9, 3};
  quicksort_process(arr, 6);
  for (int i = 0; i < 6; i++)
    printf("%d ", arr[i]);
}