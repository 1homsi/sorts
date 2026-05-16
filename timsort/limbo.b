implement TimSort;

include "sys.m";
include "draw.m";

TimSort: module {
  timsort: fn(arr: array of int, minSize: int): array of int;
};

timsort(arr: array of int, minSize: int): array of int {
  return mergesort(arr, minSize);
}

mergesort(arr: array of int, minSize: int): array of int {
  if (len arr <= 1) {
    return arr;
  }
  if (len arr <= minSize) {
    return insertionsort(arr);
  }
  
  mid := len arr / 2;
  left := arr[0:mid];
  right := arr[mid:];
  
  return merge(mergesort(left, minSize), mergesort(right, minSize));
}

insertionsort(arr: array of int): array of int {
  result := array[len arr] of int;
  for (i := 0; i < len arr; i++) {
    result[i] = arr[i];
  }
  
  for (i := 1; i < len result; i++) {
    key := result[i];
    j := i - 1;
    while (j >= 0 && result[j] > key) {
      result[j + 1] = result[j];
      j--;
    }
    result[j + 1] = key;
  }
  
  return result;
}

merge(left: array of int, right: array of int): array of int {
  result := array[len left + len right] of int;
  i := 0;
  j := 0;
  k := 0;
  
  while (i < len left && j < len right) {
    if (left[i] <= right[j]) {
      result[k] = left[i];
      i++;
    } else {
      result[k] = right[j];
      j++;
    }
    k++;
  }
  
  while (i < len left) {
    result[k] = left[i];
    i++;
    k++;
  }
  while (j < len right) {
    result[k] = right[j];
    j++;
    k++;
  }
  
  return result;
}
