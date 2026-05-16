int[] timsort(int[] arr, int minSize) {
  return mergesort(arr, minSize);
}

int[] mergesort(int[] arr, int minSize) {
  if (arr.length <= 1) {
    return arr;
  }
  if (arr.length <= minSize) {
    return insertionsort(arr);
  }
  
  int mid = arr.length / 2;
  int[] left = subset(arr, 0, mid);
  int[] right = subset(arr, mid, arr.length - mid);
  
  return merge(mergesort(left, minSize), mergesort(right, minSize));
}

int[] insertionsort(int[] arr) {
  int[] result = arr.clone();
  for (int i = 1; i < result.length; i++) {
    int key = result[i];
    int j = i - 1;
    while (j >= 0 && result[j] > key) {
      result[j + 1] = result[j];
      j--;
    }
    result[j + 1] = key;
  }
  return result;
}

int[] merge(int[] left, int[] right) {
  int[] result = new int[left.length + right.length];
  int i = 0, j = 0, k = 0;
  
  while (i < left.length && j < right.length) {
    if (left[i] <= right[j]) {
      result[k] = left[i];
      i++;
    } else {
      result[k] = right[j];
      j++;
    }
    k++;
  }
  
  while (i < left.length) {
    result[k] = left[i];
    i++;
    k++;
  }
  while (j < right.length) {
    result[k] = right[j];
    j++;
    k++;
  }
  
  return result;
}

int[] subset(int[] arr, int start, int length) {
  int[] result = new int[length];
  for (int i = 0; i < length; i++) {
    result[i] = arr[start + i];
  }
  return result;
}

void setup() {
  int[] arr = {5, 2, 8, 1, 9, 3};
  int[] sorted = timsort(arr, 32);
  println(sorted);
}

void draw() {
}
