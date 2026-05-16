public cyclesort(arr[]) {
  new n = sizeof(arr);
  new pos = 0;
  while (pos < n) {
    new item = arr[pos];
    new cycles = 0;
    for (new i = 0; i < n; i++) {
      if (i != pos && arr[i] < item) {
        cycles++;
      }
    }
    if (cycles != 0) {
      while (arr[pos] == item) {
        pos++;
      }
      new temp = arr[pos];
      arr[pos] = item;
      item = temp;
      while (cycles > 0) {
        cycles = 0;
        for (new i = 0; i < n; i++) {
          if (i != pos && arr[i] < item) {
            cycles++;
          }
        }
        while (arr[pos] == item) {
          pos++;
        }
        temp = arr[pos];
        arr[pos] = item;
        item = temp;
        cycles--;
      }
    }
    pos++;
  }
  return arr;
}

main() {
  new arr[] = {5, 2, 8, 1, 9, 3};
  cyclesort(arr);
  new i;
  for (i = 0; i < 6; i++) {
    printf("%d ", arr[i]);
  }
  printf("\n");
}
