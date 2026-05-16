void selectionSort(int[] arr) {
  int n = arr.length;
  for (int i = 0; i < n - 1; i++) {
    int minIdx = i;
    for (int j = i + 1; j < n; j++) {
      if (arr[j] < arr[minIdx]) {
        minIdx = j;
      }
    }
    int tmp = arr[i];
    arr[i] = arr[minIdx];
    arr[minIdx] = tmp;
  }
}

void setup() {
  int[] arr = {5, 2, 8, 1, 9, 3};
  selectionSort(arr);
  println(arr);
}

void draw() {}