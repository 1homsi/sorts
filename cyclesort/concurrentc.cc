process cyclesort(chan in INT [], out INT []) {
  int n = len(in);
  int pos = 0;
  while (pos < n) {
    int item = in[pos];
    int cycles = 0;
    for (int i = 0; i < n; i++) {
      if (i != pos && in[i] < item) {
        cycles++;
      }
    }
    if (cycles != 0) {
      while (in[pos] == item) {
        pos++;
      }
      int temp = in[pos];
      in[pos] = item;
      item = temp;
      while (cycles > 0) {
        cycles = 0;
        for (int i = 0; i < n; i++) {
          if (i != pos && in[i] < item) {
            cycles++;
          }
        }
        while (in[pos] == item) {
          pos++;
        }
        temp = in[pos];
        in[pos] = item;
        item = temp;
        cycles--;
      }
    }
    pos++;
  }
}

main() {
  chan c(6);
  c ! [5, 2, 8, 1, 9, 3];
  cyclesort(c);
  c?;
}
