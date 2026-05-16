fun int[] cycleSort(int arr[]) {
  int n = arr.cap();
  0 => int pos;
  while (pos < n) {
    arr[pos] => int item;
    0 => int cycles;
    for (0 => int i; i < n; i++) {
      if (i != pos && arr[i] < item) {
        cycles++;
      }
    }
    if (cycles != 0) {
      while (arr[pos] == item) {
        pos++;
      }
      arr[pos] => int temp;
      item => arr[pos];
      temp => item;
      while (cycles > 0) {
        0 => cycles;
        for (0 => int i; i < n; i++) {
          if (i != pos && arr[i] < item) {
            cycles++;
          }
        }
        while (arr[pos] == item) {
          pos++;
        }
        arr[pos] => int temp;
        item => arr[pos];
        temp => item;
        cycles--;
      }
    }
    pos++;
  }
  return arr;
}

[5, 2, 8, 1, 9, 3] @=> int test[];
cycleSort(test) => int result[];
<<<"Result:", result>>>;
