func radixsort(arr) {
  max = max(arr);
  exp = 1;
  while (max / exp > 0) {
    arr = countingSortByExp(arr, exp);
    exp = exp * 10;
  }
  return arr;
}

func countingSortByExp(arr, exp) {
  n = numberof(arr);
  output = array(0, n);
  count = array(0, 10);
  for (i = 1; i <= n; i++) {
    count((arr(i) / exp) % 10 + 1) += 1;
  }
  for (i = 2; i <= 10; i++) {
    count(i) += count(i - 1);
  }
  for (i = n; i >= 1; i--) {
    output(count((arr(i) / exp) % 10 + 1)) = arr(i);
    count((arr(i) / exp) % 10 + 1) -= 1;
  }
  return output;
}

print, radixsort([5, 2, 8, 1, 9, 3]);
