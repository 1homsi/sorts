int[] countingsort(int[] arr) {
  int max = 0;
  int len = sizeof(arr);

  for (int i = 0; i < len; i++) {
    if (arr[i] > max) {
      max = arr[i];
    }
  }

  int[] count = new int[max + 1];
  for (int i = 0; i <= max; i++) {
    count[i] = 0;
  }

  for (int i = 0; i < len; i++) {
    count[arr[i]]++;
  }

  int[] output = new int[0];
  for (int i = 0; i <= max; i++) {
    for (int j = 0; j < count[i]; j++) {
      output[output.Length] = i;
    }
  }

  return output;
}

public void OnPluginStart() {
  int[] test = {5, 2, 8, 1, 9, 3};
  int[] result = countingsort(test);
  PrintToServer("Result: %d %d %d %d %d %d", result[0], result[1], result[2], result[3], result[4], result[5]);
}
