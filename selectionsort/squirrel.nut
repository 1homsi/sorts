function selectionSort(arr) {
  local n = arr.len();
  for (local i = 0; i < n - 1; i++) {
    local minIdx = i;
    for (local j = i + 1; j < n; j++) {
      if (arr[j] < arr[minIdx]) {
        minIdx = j;
      }
    }
    local tmp = arr[i];
    arr[i] = arr[minIdx];
    arr[minIdx] = tmp;
  }
  return arr;
}

print(selectionSort([5, 2, 8, 1, 9, 3]));