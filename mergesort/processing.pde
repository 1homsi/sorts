void merge(int[] arr, int left, int mid, int right) {
  int[] result = new int[right - left + 1];
  int i = left, j = mid + 1, k = 0;
  
  while (i <= mid && j <= right) {
    if (arr[i] <= arr[j]) {
      result[k] = arr[i];
      i++;
    } else {
      result[k] = arr[j];
      j++;
    }
    k++;
  }
  
  while (i <= mid) {
    result[k] = arr[i];
    i++;
    k++;
  }
  
  while (j <= right) {
    result[k] = arr[j];
    j++;
    k++;
  }
  
  for (k = 0; k < result.length; k++) {
    arr[left + k] = result[k];
  }
}

void mergesort(int[] arr, int left, int right) {
  if (left < right) {
    int mid = (left + right) / 2;
    mergesort(arr, left, mid);
    mergesort(arr, mid + 1, right);
    merge(arr, left, mid, right);
  }
}

void draw() {
  int[] arr = {5, 2, 8, 1, 9, 3};
  mergesort(arr, 0, 5);
  println(arr);
  noLoop();
}
