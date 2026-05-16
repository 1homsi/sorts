void bubblesort(array<int>@ arr) {
  int n = arr.length();
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n - 1 - i; j++) {
      if (arr[j] > arr[j+1]) {
        int temp = arr[j];
        arr[j] = arr[j+1];
        arr[j+1] = temp;
      }
    }
  }
}

void main() {
  array<int> arr = {5, 2, 8, 1, 9, 3};
  bubblesort(@arr);
  print(arr)
}