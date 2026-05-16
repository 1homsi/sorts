function shellsort(arr) {
  local n = arr.len();
  local gap = 1;
  while (gap <= n) {
    gap = gap * 3 + 1;
  }
  while (gap > 0) {
    gap = gap / 3;
    for (local i = gap; i < n; i++) {
      local temp = arr[i];
      local j = i;
      while (j >= gap && arr[j - gap] > temp) {
        arr[j] = arr[j - gap];
        j -= gap;
      }
      arr[j] = temp;
    }
  }
  return arr;
}
print(shellsort([5, 2, 8, 1, 9, 3]));
