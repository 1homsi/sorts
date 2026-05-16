void timsort(array<int>@ arr, int minSize = 32) {
  mergesort(arr, minSize);
}

void mergesort(array<int>@ arr, int minSize) {
  if (arr.length() <= 1) {
    return;
  }
  if (arr.length() <= minSize) {
    insertionsort(arr);
    return;
  }
  
  int mid = arr.length() / 2;
  array<int> left();
  array<int> right();
  
  for (uint i = 0; i < mid; i++) {
    left.insertLast(arr[i]);
  }
  for (uint i = mid; i < arr.length(); i++) {
    right.insertLast(arr[i]);
  }
  
  mergesort(left, minSize);
  mergesort(right, minSize);
  merge(arr, left, right);
}

void insertionsort(array<int>@ arr) {
  for (uint i = 1; i < arr.length(); i++) {
    int key = arr[i];
    int j = i - 1;
    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = key;
  }
}

void merge(array<int>@ arr, array<int>@ left, array<int>@ right) {
  uint i = 0, j = 0, k = 0;
  
  while (i < left.length() && j < right.length()) {
    if (left[i] <= right[j]) {
      arr[k] = left[i];
      i++;
    } else {
      arr[k] = right[j];
      j++;
    }
    k++;
  }
  
  while (i < left.length()) {
    arr[k] = left[i];
    i++;
    k++;
  }
  while (j < right.length()) {
    arr[k] = right[j];
    j++;
    k++;
  }
}

void main() {
  array<int> arr = {5, 2, 8, 1, 9, 3};
  timsort(arr);
  for (uint i = 0; i < arr.length(); i++) {
    print(arr[i] + " ");
  }
}
