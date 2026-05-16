function timsort(arr, minSize = 32) {
  return mergesort(arr, minSize);
}

function mergesort(arr, minSize) {
  if (arr.len() <= 1) {
    return arr;
  }
  if (arr.len() <= minSize) {
    return insertionsort(arr);
  }
  
  local mid = arr.len() / 2;
  local left = arr.slice(0, mid);
  local right = arr.slice(mid);
  
  return merge(mergesort(left, minSize), mergesort(right, minSize));
}

function insertionsort(arr) {
  local result = array(arr.len());
  for (local i = 0; i < arr.len(); i++) {
    result[i] = arr[i];
  }
  
  for (local i = 1; i < result.len(); i++) {
    local key = result[i];
    local j = i - 1;
    while (j >= 0 && result[j] > key) {
      result[j + 1] = result[j];
      j--;
    }
    result[j + 1] = key;
  }
  return result;
}

function merge(left, right) {
  local result = [];
  local i = 0;
  local j = 0;
  
  while (i < left.len() && j < right.len()) {
    if (left[i] <= right[j]) {
      result.push(left[i]);
      i++;
    } else {
      result.push(right[j]);
      j++;
    }
  }
  
  while (i < left.len()) {
    result.push(left[i]);
    i++;
  }
  while (j < right.len()) {
    result.push(right[j]);
    j++;
  }
  
  return result;
}

local arr = [5, 2, 8, 1, 9, 3];
print(timsort(arr) + "\n");
