public TimSort(arr[], size, minSize = 32) {
  MergeSort(arr, 0, size - 1, minSize);
}

public MergeSort(arr[], left, right, minSize) {
  if (left >= right) {
    return;
  }
  if (right - left + 1 <= minSize) {
    InsertionSort(arr, left, right);
    return;
  }
  
  new mid = left + (right - left) / 2;
  MergeSort(arr, left, mid, minSize);
  MergeSort(arr, mid + 1, right, minSize);
  Merge(arr, left, mid, right);
}

public InsertionSort(arr[], left, right) {
  for (new i = left + 1; i <= right; i++) {
    new key = arr[i];
    new j = i - 1;
    while (j >= left && arr[j] > key) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = key;
  }
}

public Merge(arr[], left, mid, right) {
  new temp[6];
  new i = left, j = mid + 1, k = 0;
  
  while (i <= mid && j <= right) {
    if (arr[i] <= arr[j]) {
      temp[k++] = arr[i++];
    } else {
      temp[k++] = arr[j++];
    }
  }
  
  while (i <= mid) {
    temp[k++] = arr[i++];
  }
  while (j <= right) {
    temp[k++] = arr[j++];
  }
  
  for (new i = left; i <= right; i++) {
    arr[i] = temp[i - left];
  }
}

public main() {
  new arr[6] = {5, 2, 8, 1, 9, 3};
  TimSort(arr, 6);
  for (new i = 0; i < 6; i++) {
    printf("%d ", arr[i]);
  }
}
