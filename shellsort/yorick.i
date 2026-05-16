func shellsort(arr) {
  n = numberof(arr);
  gap = 1;
  while (gap <= n) gap = gap * 3 + 1;
  while (gap > 0) {
    gap = gap / 3;
    for (i = gap + 1; i <= n; i++) {
      temp = arr(i);
      j = i;
      while (j > gap && arr(j - gap) > temp) {
        arr(j) = arr(j - gap);
        j = j - gap;
      }
      arr(j) = temp;
    }
  }
  return arr;
}
write, shellsort([5, 2, 8, 1, 9, 3]);
