func insertionSort(arr) {
  n = numberof(arr);
  for (i=2; i<=n; i++) {
    key = arr(i);
    j = i - 1;
    while (j >= 1 && arr(j) > key) {
      arr(j+1) = arr(j);
      j = j - 1;
    }
    arr(j+1) = key;
  }
  return arr;
}

arr = [5, 2, 8, 1, 9, 3];
print, insertionSort(arr);