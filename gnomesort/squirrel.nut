function gnomesort(arr) {
  local i = 0;
  while (i < arr.len()) {
    if (i == 0) {
      i++;
    } else if (arr[i] < arr[i - 1]) {
      local temp = arr[i];
      arr[i] = arr[i - 1];
      arr[i - 1] = temp;
      i--;
    } else {
      i++;
    }
  }
  return arr;
}

local test = [5, 2, 8, 1, 9, 3];
print(gnomesort(test));
