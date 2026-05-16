const int minRun = 32;

void insertionSort(List<int> arr, int left, int right) {
  for (int i = left + 1; i <= right; i++) {
    int key = arr[i];
    int j = i - 1;
    while (j >= left && arr[j] > key) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = key;
  }
}

void merge(List<int> arr, int left, int mid, int right) {
  List<int> leftPart = arr.sublist(left, mid + 1);
  List<int> rightPart = arr.sublist(mid + 1, right + 1);
  int i = 0, j = 0, k = left;
  while (i < leftPart.length && j < rightPart.length) {
    if (leftPart[i] <= rightPart[j]) {
      arr[k++] = leftPart[i++];
    } else {
      arr[k++] = rightPart[j++];
    }
  }
  while (i < leftPart.length) arr[k++] = leftPart[i++];
  while (j < rightPart.length) arr[k++] = rightPart[j++];
}

void timsort(List<int> arr) {
  int n = arr.length;
  for (int i = 0; i < n; i += minRun) {
    insertionSort(arr, i, (i + minRun - 1).clamp(0, n - 1));
  }
  for (int size = minRun; size < n; size *= 2) {
    for (int left = 0; left < n; left += 2 * size) {
      int mid = (left + size - 1).clamp(0, n - 1);
      int right = (left + 2 * size - 1).clamp(0, n - 1);
      if (mid < right) merge(arr, left, mid, right);
    }
  }
}

void main() {
  List<int> arr = [5, 2, 8, 1, 9, 3, 7, 4, 6];
  timsort(arr);
  print(arr);
}
