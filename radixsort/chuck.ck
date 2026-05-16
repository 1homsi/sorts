fun int[] radixsort(int arr[]) {
  int max = 0;
  for (0 => int i; i < arr.size(); i++) {
    if (arr[i] > max) arr[i] => max;
  }
  1 => int exp;
  while (max / exp > 0) {
    countingSortByExp(arr, exp) @=> arr;
    exp * 10 => exp;
  }
  return arr;
}

fun int[] countingSortByExp(int arr[], int exp) {
  arr.size() => int n;
  int output[n];
  int count[10];

  for (0 => int i; i < 10; i++) 0 => count[i];
  for (0 => int i; i < n; i++) {
    ((arr[i] / exp) % 10) => int idx;
    (count[idx] + 1) @=> count[idx];
  }
  for (1 => int i; i < 10; i++) {
    (count[i] + count[i - 1]) @=> count[i];
  }
  for (n - 1 => int i; i >= 0; i--) {
    ((arr[i] / exp) % 10) => int idx;
    arr[i] => output[(count[idx] - 1)];
    (count[idx] - 1) @=> count[idx];
  }
  return output;
}

[5, 2, 8, 1, 9, 3] @=> int arr[];
radixsort(arr) @=> arr[];
<<< arr >>>;
