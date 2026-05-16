func merge(arr, left, mid, right) {
  i = left;
  j = mid + 1;
  k = 1;
  result = array(right - left + 1);
  
  while (i <= mid && j <= right) {
    if (arr(i) <= arr(j)) {
      result(k) = arr(i);
      i = i + 1;
    } else {
      result(k) = arr(j);
      j = j + 1;
    }
    k = k + 1;
  }
  
  while (i <= mid) {
    result(k) = arr(i);
    i = i + 1;
    k = k + 1;
  }
  
  while (j <= right) {
    result(k) = arr(j);
    j = j + 1;
    k = k + 1;
  }
  
  for (k = 1; k <= numberof(result); k++) {
    arr(left + k - 1) = result(k);
  }
}

func mergesort(arr, left, right) {
  if (left < right) {
    mid = (left + right) / 2;
    mergesort, arr, left, mid;
    mergesort, arr, mid + 1, right;
    merge, arr, left, mid, right;
  }
}

arr = [5, 2, 8, 1, 9, 3];
mergesort, arr, 1, 6;
print, arr;
