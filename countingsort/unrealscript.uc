function array<int> CountingSort(array<int> arr) {
  local int max, i, j;
  local array<int> count;
  local array<int> output;

  if (arr.Length == 0) return arr;

  max = 0;
  for (i = 0; i < arr.Length; i++) {
    if (arr[i] > max) {
      max = arr[i];
    }
  }

  count.Length = max + 1;
  for (i = 0; i <= max; i++) {
    count[i] = 0;
  }

  for (i = 0; i < arr.Length; i++) {
    count[arr[i]]++;
  }

  output.Length = 0;
  for (i = 0; i <= max; i++) {
    for (j = 0; j < count[i]; j++) {
      output[output.Length] = i;
    }
  }

  return output;
}

event PostBeginPlay() {
  local array<int> test;
  test[0] = 5;
  test[1] = 2;
  test[2] = 8;
  test[3] = 1;
  test[4] = 9;
  test[5] = 3;
  `log(CountingSort(test));
}
