fn timsort(arr: []int, minSize: size) void = {
  mergesort(arr, minSize);
};

fn mergesort(arr: []int, minSize: size) void = {
  if (len(arr) <= 1) {
    return;
  }
  if (len(arr) <= minSize) {
    insertionsort(arr);
    return;
  }
  
  let mid = len(arr) / 2;
  let left = arr[..mid];
  let right = arr[mid..];
  
  mergesort(left, minSize);
  mergesort(right, minSize);
  merge(arr, left, right);
};

fn insertionsort(arr: []int) void = {
  for (let i = 1; i < len(arr); i += 1) {
    let key = arr[i];
    let j = (i: int) - 1;
    for (j >= 0 && arr[j] > key; j -= 1) {
      arr[j + 1] = arr[j];
    };
    arr[j + 1] = key;
  };
};

fn merge(arr: []int, left: []int, right: []int) void = {
  let i = 0;
  let j = 0;
  let k = 0;
  
  for (i < len(left) && j < len(right); k += 1) {
    if (left[i] <= right[j]) {
      arr[k] = left[i];
      i += 1;
    } else {
      arr[k] = right[j];
      j += 1;
    };
  };
};
