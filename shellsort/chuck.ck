int shellsort(int arr[]) {
  int n = arr.cap();
  int gap = 1;
  while (gap <= n) { gap * 3 + 1 => gap; }
  while (gap > 0) {
    gap / 3 => gap;
    for (int i = gap; i < n; i++) {
      arr[i] => int temp;
      int j = i;
      while (j >= gap && arr[j - gap] > temp) {
        arr[j - gap] => arr[j];
        j - gap => j;
      }
      temp => arr[j];
    }
  }
  return 0;
}
int arr[6];
[5, 2, 8, 1, 9, 3] => arr;
shellsort(arr);
for (int i = 0; i < arr.cap(); i++) <<< arr[i] >>>;
