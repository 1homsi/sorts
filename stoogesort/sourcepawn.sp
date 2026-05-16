public stoogesort(a[], i, j) {
  new temp;
  if (a[j] < a[i]) {
    temp = a[j];
    a[j] = a[i];
    a[i] = temp;
  }
  if (j - i > 1) {
    new t = (j - i + 1) / 3;
    stoogesort(a, i, j - t);
    stoogesort(a, i + t, j);
    stoogesort(a, i, j - t);
  }
}

public main() {
  new arr[6] = {5, 2, 8, 1, 9, 3};
  stoogesort(arr, 0, 5);
  for (new i = 0; i < 6; i++) print(arr[i]);
}
