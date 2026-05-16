public stoogesort(arr[], i, j) {
  if (arr[j] < arr[i]) {
    new temp = arr[j];
    arr[j] = arr[i];
    arr[i] = temp;
  }
  if (j - i > 1) {
    new t = (j - i + 1) / 3;
    stoogesort(arr, i, j - t);
    stoogesort(arr, i + t, j);
    stoogesort(arr, i, j - t);
  }
}

public main() {
  new arr[6] = {5, 2, 8, 1, 9, 3};
  stoogesort(arr, 0, 5);
  for (new i = 0; i < 6; i++)
    printf("%d ", arr[i]);
}
