new array[6] = {5, 2, 8, 1, 9, 3};

main() {
  new max = 0;
  new output[6];

  for (new i = 0; i < 6; i++) {
    if (array[i] > max) {
      max = array[i];
    }
  }

  new count[10];
  for (new i = 0; i <= max; i++) {
    count[i] = 0;
  }

  for (new i = 0; i < 6; i++) {
    count[array[i]]++;
  }

  new out_idx = 0;
  for (new i = 0; i <= max; i++) {
    for (new j = 0; j < count[i]; j++) {
      output[out_idx] = i;
      out_idx++;
    }
  }

  for (new i = 0; i < 6; i++) {
    printf("%d ", output[i]);
  }

  return 0;
}
