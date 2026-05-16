int[] CycleSort(int arr[]) {
  int n = sizeof(arr);
  for (int pos = 0; pos < n; pos++) {
    int item = arr[pos];
    int cycles = 0;
    for (int i = 0; i < n; i++) {
      if (i != pos && arr[i] < item) {
        cycles++;
      }
    }
    if (cycles != 0) {
      while (arr[pos] == item) {
        pos++;
      }
      int temp = arr[pos];
      arr[pos] = item;
      item = temp;
      while (cycles > 0) {
        cycles = 0;
        for (int i = 0; i < n; i++) {
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
  }
  return arr;
}

public void OnPluginStart() {
  int test[] = {5, 2, 8, 1, 9, 3};
  CycleSort(test);
  PrintToServer("Sorted: %i %i %i %i %i %i", test[0], test[1], test[2], test[3], test[4], test[5]);
}
