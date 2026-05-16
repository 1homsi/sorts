shellsort(a: array of int): array of int {
  n := len a;
  gap := 1;
  while (gap <= n) gap = gap * 3 + 1;
  while (gap > 0) {
    gap = gap / 3;
    for (i := gap; i < n; i++) {
      temp := a[i];
      j := i;
      while (j >= gap && a[j - gap] > temp) {
        a[j] = a[j - gap];
        j -= gap;
      }
      a[j] = temp;
    }
  }
  return a;
}
