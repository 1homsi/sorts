void heapify(List<int> arr, int n, int i) {
  int largest = i, left = 2 * i + 1, right = 2 * i + 2;
  if (left < n && arr[left] > arr[largest]) largest = left;
  if (right < n && arr[right] > arr[largest]) largest = right;
  if (largest != i) {
    int tmp = arr[i]; arr[i] = arr[largest]; arr[largest] = tmp;
    heapify(arr, n, largest);
  }
}

void heapsort(List<int> arr) {
  int n = arr.length;
  for (int i = n ~/ 2 - 1; i >= 0; i--) heapify(arr, n, i);
  for (int i = n - 1; i > 0; i--) {
    int tmp = arr[0]; arr[0] = arr[i]; arr[i] = tmp;
    heapify(arr, i, 0);
  }
}

void main() {
  List<int> arr = [12, 11, 13, 5, 6, 7];
  heapsort(arr);
  print(arr);
}
