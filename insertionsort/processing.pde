int[] insertionSort(int[] arr) {
  int n = arr.length;
  for (int i = 1; i < n; i++) {
    int key = arr[i];
    int j = i - 1;
    while (j >= 0 && arr[j] > key) {
      arr[j+1] = arr[j];
      j--;
    }
    arr[j+1] = key;
  }
  return arr;
}

void setup() {
  int[] arr = {5, 2, 8, 1, 9, 3};
  arr = insertionSort(arr);
  println(arr);
}