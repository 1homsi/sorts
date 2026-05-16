int[] cycleSort(int[] arr) {
  int n = arr.length;
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

void setup() {
  int[] result = cycleSort(new int[]{5, 2, 8, 1, 9, 3});
  println(result);
}
