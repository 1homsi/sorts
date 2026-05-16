func bubblesort(arr) {
  n = numberof(arr);
  for (i=1; i<=n; i++) {
    for (j=1; j<=n-i; j++) {
      if (arr(j) > arr(j+1)) {
        temp = arr(j);
        arr(j) = arr(j+1);
        arr(j+1) = temp;
      }
    }
  }
  return arr;
}

result = bubblesort([5, 2, 8, 1, 9, 3]);
print, result;