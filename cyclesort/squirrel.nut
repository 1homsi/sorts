function cycleSort(arr) {
  local n = arr.len();
  for (local pos = 0; pos < n; pos++) {
    local item = arr[pos];
    local cycles = 0;
    for (local i = 0; i < n; i++) {
      if (i != pos && arr[i] < item) {
        cycles++;
      }
    }
    if (cycles == 0) continue;
    while (arr[pos] == item) {
      pos++;
    }
    local temp = arr[pos];
    arr[pos] = item;
    item = temp;
    while (cycles > 0) {
      cycles = 0;
      for (local i = 0; i < n; i++) {
        if (i != pos && arr[i] < item) {
          cycles++;
        }
      }
      while (arr[pos] == item) {
        pos++;
      }
      temp = arr[pos];
      arr[pos] = item;
      item = temp;
      cycles--;
    }
  }
  return arr;
}

local result = cycleSort([5, 2, 8, 1, 9, 3]);
print(result + "\n");
