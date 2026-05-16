public GnomeSort(arr[], size) {
  new i = 0;
  new temp;

  while (i < size) {
    if (i == 0) {
      i++;
    } else if (arr[i] < arr[i - 1]) {
      temp = arr[i];
      arr[i] = arr[i - 1];
      arr[i - 1] = temp;
      i--;
    } else {
      i++;
    }
  }
}

public main() {
  new test[6] = {5, 2, 8, 1, 9, 3};
  GnomeSort(test, 6);

  for (new i = 0; i < 6; i++) {
    printf("%d ", test[i]);
  }
}
