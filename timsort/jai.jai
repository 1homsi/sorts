timsort :: (arr: []int, minSize: int) -> []int {
  return mergesort(arr, minSize);
}

mergesort :: (arr: []int, minSize: int) -> []int {
  if arr.count <= 1 {
    return arr;
  }
  if arr.count <= minSize {
    return insertionsort(arr);
  }
  
  mid := arr.count / 2;
  left := arr[0..mid];
  right := arr[mid..];
  
  return merge(mergesort(left, minSize), mergesort(right, minSize));
}

insertionsort :: (arr: []int) -> []int {
  result := arr;
  for i in 1..result.count {
    key := result[i];
    j := i - 1;
    while j >= 0 && result[j] > key {
      result[j + 1] = result[j];
      j -= 1;
    }
    result[j + 1] = key;
  }
  return result;
}

merge :: (left: []int, right: []int) -> []int {
  result := make([]int);
  i := 0;
  j := 0;
  
  while i < left.count && j < right.count {
    if left[i] <= right[j] {
      array_add(*result, left[i]);
      i += 1;
    } else {
      array_add(*result, right[j]);
      j += 1;
    }
  }
  
  while i < left.count {
    array_add(*result, left[i]);
    i += 1;
  }
  while j < right.count {
    array_add(*result, right[j]);
    j += 1;
  }
  
  return result;
}

main :: () {
  arr := int.[5, 2, 8, 1, 9, 3];
  print(mergesort(arr, 32));
}
