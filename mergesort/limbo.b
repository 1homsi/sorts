implement Mergesort;

include "sys.m";

Mergesort: module {
  merge: fn(arr: array of int, left: int, mid: int, right: int);
  mergesort: fn(arr: array of int, left: int, right: int);
};

merge(arr: array of int, left: int, mid: int, right: int) {
  result := array[right - left + 1] of int;
  i := left;
  j := mid + 1;
  k := 0;
  
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
  
  for (k = 0; k < len result; k++) {
    arr[left + k] = result[k];
  }
}

mergesort(arr: array of int, left: int, right: int) {
  if (left < right) {
    mid := (left + right) / 2;
    mergesort(arr, left, mid);
    mergesort(arr, mid + 1, right);
    merge(arr, left, mid, right);
  }
}
