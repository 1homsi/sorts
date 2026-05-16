int[] radixsort(int[] arr) {
  int max = 0;
  for (int x : arr) {
    if (x > max) max = x;
  }
  int exp = 1;
  while (max / exp > 0) {
    arr = countingSortByExp(arr, exp);
    exp *= 10;
  }
  return arr;
}

int[] countingSortByExp(int[] arr, int exp) {
  int n = arr.length;
  int[] output = new int[n];
  int[] count = new int[10];
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

void setup() {
  int[] result = radixsort(new int[]{5, 2, 8, 1, 9, 3});
  println(result);
}
