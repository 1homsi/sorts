function bubblesort(arr) {
  local n = arr.len();
  for (local i = 0; i < n; i++) {
    for (local j = 0; j < n - 1 - i; j++) {
      if (arr[j] > arr[j + 1]) {
        local temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
  return arr;
}

local sorted = bubblesort([5, 2, 8, 1, 9, 3]);
print(sorted);