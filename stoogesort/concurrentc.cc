#include <stdio.h>

void stoogesort(int a[], int i, int j) {
  if (a[j] < a[i]) {
    int temp = a[j];
    a[j] = a[i];
    a[i] = temp;
  }
  if (j - i > 1) {
    int t = (j - i + 1) / 3;
    stoogesort(a, i, j - t);
    stoogesort(a, i + t, j);
    stoogesort(a, i, j - t);
  }
}

void main() {
  int arr[6] = {5, 2, 8, 1, 9, 3};
  stoogesort(arr, 0, 5);
  printf("%d %d %d %d %d %d\n", arr[0], arr[1], arr[2], arr[3], arr[4], arr[5]);
}
