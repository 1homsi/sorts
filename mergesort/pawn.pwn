merge(arr[], left, mid, right) {
  new i = left, j = mid + 1, k = 0;
  new result[10];
  
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
  
  for (k = 0; k < right - left + 1; k++) {
    arr[left + k] = result[k];
  }
}

mergesort(arr[], left, right) {
  if (left < right) {
    new mid = (left + right) / 2;
    mergesort(arr, left, mid);
    mergesort(arr, mid + 1, right);
    merge(arr, left, mid, right);
  }
}

main() {
  new arr[] = {5, 2, 8, 1, 9, 3};
  mergesort(arr, 0, 5);
  print(arr);
}
