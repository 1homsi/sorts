function radixsort(arr) {
  local max = 0;
  foreach (x in arr) {
    if (x > max) max = x;
  }
  local exp = 1;
  while (max / exp > 0) {
    arr = countingSortByExp(arr, exp);
    exp *= 10;
  }
  return arr;
}

function countingSortByExp(arr, exp) {
  local n = arr.len();
  local output = array(n);
  local count = array(10, 0);
  foreach (i, x in arr) {
    count[(x / exp) % 10]++;
  }
  for (local i = 1; i < 10; i++) {
    count[i] += count[i - 1];
  }
  for (local i = n - 1; i >= 0; i--) {
    output[count[(arr[i] / exp) % 10] - 1] = arr[i];
    count[(arr[i] / exp) % 10]--;
  }
  return output;
}

print(radixsort([5, 2, 8, 1, 9, 3]));
