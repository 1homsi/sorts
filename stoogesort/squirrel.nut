function stoogesort(a, i, j) {
  if (a[j] < a[i]) {
    local temp = a[j];
    a[j] = a[i];
    a[i] = temp;
  }
  if (j - i > 1) {
    local t = (j - i + 1) / 3;
    stoogesort(a, i, j - t);
    stoogesort(a, i + t, j);
    stoogesort(a, i, j - t);
  }
}

local arr = [5, 2, 8, 1, 9, 3];
stoogesort(arr, 0, 5);
print(arr);
