fun int[] selectionSort(int arr[]) {
  arr.size() => int n;
  for (0 => int i; i < n - 1; i++) {
    i => int minIdx;
    for (i + 1 => int j; j < n; j++) {
      if (arr[j] < arr[minIdx]) {
        j => minIdx;
      }
    }
    arr[i] => int tmp;
    arr[minIdx] => arr[i];
    tmp => arr[minIdx];
  }
  return arr;
}

[5, 2, 8, 1, 9, 3] @=> int myArr[];
selectionSort(myArr) @=> myArr;
myArr.toString() => now;