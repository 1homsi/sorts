public shellsort(arr[], n) {
  new gap = 1, i, j, temp;
  while (gap <= n) gap = gap * 3 + 1;
  while (gap > 0) {
    gap = gap / 3;
    for (i = gap; i < n; i++) {
      temp = arr[i];
      j = i;
      while (j >= gap && arr[j - gap] > temp) {
        arr[j] = arr[j - gap];
        j -= gap;
      }
      arr[j] = temp;
    }
  }
}
main() {
  new arr[6] = {5, 2, 8, 1, 9, 3};
  shellsort(arr, 6);
  for (new i = 0; i < 6; i++) printf("%d ", arr[i]);
}
