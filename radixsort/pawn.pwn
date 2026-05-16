radixsort(arr[], n) {
  new max = 0;
  for (new i = 0; i < n; i++) {
    if (arr[i] > max) max = arr[i];
  }
  new exp = 1;
  while (max / exp > 0) {
    countingSortByExp(arr, n, exp);
    exp *= 10;
  }
  return 0;
}

countingSortByExp(arr[], n, exp) {
  new output[n];
  new count[10];
  for (new i = 0; i < 10; i++) count[i] = 0;
  for (new i = 0; i < n; i++) {
    count[(arr[i] / exp) % 10]++;
  }
}

main() {
  new arr[] = {5, 2, 8, 1, 9, 3};
  radixsort(arr, 6);
  for (new i = 0; i < 6; i++) {
    printf("%d ", arr[i]);
  }
}
