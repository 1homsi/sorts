func selection_sort(arr) {
  n = numberof(arr);
  for (i = 1; i <= n - 1; i++) {
    min_idx = i;
    for (j = i + 1; j <= n; j++) {
      if (arr(j) < arr(min_idx)) {
        min_idx = j;
      }
    }
    tmp = arr(i);
    arr(i) = arr(min_idx);
    arr(min_idx) = tmp;
  }
  return arr;
}

arr = [5, 2, 8, 1, 9, 3];
write, selection_sort(arr);