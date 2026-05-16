function comb_sort(arr) {
  local gap = arr.len();
  local swapped = true;
  while (gap > 1 || swapped) {
    gap = (gap * 10 / 13).tointeger();
    if (gap < 1) gap = 1;
    swapped = false;
    for (local i = 0; i < arr.len() - gap; i++) {
      if (arr[i] > arr[i + gap]) {
        local temp = arr[i];
        arr[i] = arr[i + gap];
        arr[i + gap] = temp;
        swapped = true;
      }
    }
  }
  return arr;
}

local sample = [5, 2, 8, 1, 9, 3];
print(comb_sort(sample) + "\n");
