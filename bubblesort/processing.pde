int[] bubblesort(int[] arr) {
  int n = arr.length;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n - 1 - i; j++) {
      if (arr[j] > arr[j+1]) {
        int temp = arr[j];
        arr[j] = arr[j+1];
        arr[j+1] = temp;
      }
    }
  }
  return arr;
}

void setup() {
  int[] arr = {5, 2, 8, 1, 9, 3};
  int[] result = bubblesort(arr);
  for (int i = 0; i < result.length; i++) {
    print(result[i] + " ");
  }
  println();
}