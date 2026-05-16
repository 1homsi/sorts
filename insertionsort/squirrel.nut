function insertionSort(arr) {
  local n = arr.len();
  for (local i = 1; i < n; i++) {
    local key = arr[i];
    local j = i - 1;
    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = key;
  }
  return arr;
}

print(insertionSort([5, 2, 8, 1, 9, 3]));