implement Bubblesort;

include "sys.m";

Bubblesort: module {
  bubblesort: fn(arr: array of int): array of int;
};

bubblesort(arr: array of int): array of int {
  n := len(arr);
  for (i := 0; i < n; i++) {
    for (j := 0; j < n - 1 - i; j++) {
      if (arr[j] > arr[j+1]) {
        temp := arr[j];
        arr[j] = arr[j+1];
        arr[j+1] = temp;
      }
    }
  }
  return arr;
}