public int[] RadixSort(int[] arr) {
  int max = 0;
  for (int i = 0; i < sizeof(arr); i++) {
    if (arr[i] > max) max = arr[i];
  }
  int exp = 1;
  while (max / exp > 0) {
    arr = CountingSortByExp(arr, exp);
    exp *= 10;
  }
  return arr;
}

public int[] CountingSortByExp(int[] arr, int exp) {
  int n = sizeof(arr);
  int output[n];
  int count[10];

  for (int i = 0; i < 10; i++) count[i] = 0;
  for (int i = 0; i < n; i++) {
    count[(arr[i] / exp) % 10]++;
  }
  for (int i = 1; i < 10; i++) {
    count[i] += count[i - 1];
  }
  for (int i = n - 1; i >= 0; i--) {
    output[count[(arr[i] / exp) % 10] - 1] = arr[i];
    count[(arr[i] / exp) % 10]--;
  }
  return output;
}

public void OnPluginStart() {
  int arr[6] = {5, 2, 8, 1, 9, 3};
  PrintToServer("Result: %d", RadixSort(arr)[0]);
}
