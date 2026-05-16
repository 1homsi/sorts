function CombSort(out arr, len) {
  local gap, i, temp;
  gap = len;
  while (gap > 1) {
    gap = int(gap * 10.0 / 13.0);
    if (gap < 1) gap = 1;
    for (i = 0; i < len - gap; i++) {
      if (arr[i] > arr[i + gap]) {
        temp = arr[i];
        arr[i] = arr[i + gap];
        arr[i + gap] = temp;
      }
    }
  }
}

function TestCombSort() {
  local arr, i;
  arr[0] = 5;
  arr[1] = 2;
  arr[2] = 8;
  arr[3] = 1;
  arr[4] = 9;
  arr[5] = 3;
  CombSort(arr, 6);
  for (i = 0; i < 6; i++) {
    log(arr[i]);
  }
}
