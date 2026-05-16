void bubbleSort(List<int> arr) {
  int n = arr.length;
  bool swapped;
  do {
    swapped = false;
    for (int i = 0; i < n - 1; i++) {
      if (arr[i] > arr[i + 1]) {
        int tmp = arr[i];
        arr[i] = arr[i + 1];
        arr[i + 1] = tmp;
        swapped = true;
      }
    }
    n--;
  } while (swapped);
}

void main() {
  List<int> arr = [64, 34, 25, 12, 22, 11, 90];
  bubbleSort(arr);
  print(arr);
}
