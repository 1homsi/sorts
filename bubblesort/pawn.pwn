public bubblesort(arr[], size = sizeof arr) {
  new n = size, i, j, temp;
  for (i = 0; i < n; i++) {
    for (j = 0; j < n - 1 - i; j++) {
      if (arr[j] > arr[j + 1]) {
        temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
}

public main() {
  new arr[6] = {5, 2, 8, 1, 9, 3};
  bubblesort(arr);
  for (new i = 0; i < 6; i++) print(arr[i]);
}