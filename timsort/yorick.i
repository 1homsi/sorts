func timsort(arr, minSize) {
  return mergesort(arr, minSize);
}

func mergesort(arr, minSize) {
  if (numberof(arr) <= 1) {
    return arr;
  }
  if (numberof(arr) <= minSize) {
    return insertionsort(arr);
  }
  
  mid = numberof(arr) / 2;
  left = arr(1:mid);
  right = arr(mid+1:numberof(arr));
  
  return merge(mergesort(left, minSize), mergesort(right, minSize));
}

func insertionsort(arr) {
  result = arr;
  for (i = 2; i <= numberof(result); i++) {
    key = result(i);
    j = i - 1;
    while (j >= 1 && result(j) > key) {
      result(j+1) = result(j);
      j = j - 1;
    }
    result(j+1) = key;
  }
  return result;
}

func merge(left, right) {
  result = [];
  i = 1;
  j = 1;
  
  while (i <= numberof(left) && j <= numberof(right)) {
    if (left(i) <= right(j)) {
      grow, result, left(i);
      i = i + 1;
    } else {
      grow, result, right(j);
      j = j + 1;
    }
  }
  
  while (i <= numberof(left)) {
    grow, result, left(i);
    i = i + 1;
  }
  while (j <= numberof(right)) {
    grow, result, right(j);
    j = j + 1;
  }
  
  return result;
}

arr = [5, 2, 8, 1, 9, 3];
write, timsort(arr, 32);
