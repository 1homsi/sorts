fun int[] timsort(int arr[], int minSize) {
  return mergesort(arr, minSize);
}

fun int[] mergesort(int arr[], int minSize) {
  if (arr.cap() <= 1) {
    return arr;
  }
  if (arr.cap() <= minSize) {
    return insertionsort(arr);
  }
  
  int mid = arr.cap() / 2;
  int left[mid];
  int right[arr.cap() - mid];
  
  for (0 => int i; i < mid; i++) {
    arr[i] => left[i];
  }
  for (mid => int i; i < arr.cap(); i++) {
    arr[i] => right[i - mid];
  }
  
  return merge(mergesort(left, minSize), mergesort(right, minSize));
}

fun int[] insertionsort(int arr[]) {
  for (1 => int i; i < arr.cap(); i++) {
    int key = arr[i];
    int j = i - 1;
    while (j >= 0 && arr[j] > key) {
      arr[j + 1] => arr[j];
      j--;
    }
    key => arr[j + 1];
  }
  return arr;
}

fun int[] merge(int left[], int right[]) {
  int result[left.cap() + right.cap()];
  int resIdx = 0;
  int i = 0;
  int j = 0;
  
  while (i < left.cap() && j < right.cap()) {
    if (left[i] <= right[j]) {
      left[i] => result[resIdx];
      i++;
    } else {
      right[j] => result[resIdx];
      j++;
    }
    resIdx++;
  }
  
  while (i < left.cap()) {
    left[i] => result[resIdx];
    i++;
    resIdx++;
  }
  while (j < right.cap()) {
    right[j] => result[resIdx];
    j++;
    resIdx++;
  }
  
  return result;
}

int arr[6];
[5, 2, 8, 1, 9, 3] @=> arr;
timsort(arr, 32) @=> arr;
<<< arr >>>;
