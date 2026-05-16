fn merge(arr: *[*]int, left: int, mid: int, right: int) void = {
  let i = left;
  let j = mid + 1;
  let result: [10]int = [0...];
  let k = 0;
  
  for (i <= mid && j <= right) {
    if (arr[i] <= arr[j]) {
      result[k] = arr[i];
      i += 1;
    } else {
      result[k] = arr[j];
      j += 1;
    }
    k += 1;
  };
  
  for (i <= mid) {
    result[k] = arr[i];
    i += 1;
    k += 1;
  };
  
  for (j <= right) {
    result[k] = arr[j];
    j += 1;
    k += 1;
  };
  
  for (let l = 0; l < right - left + 1; l += 1) {
    arr[left + l] = result[l];
  };
};

fn mergesort(arr: *[*]int, left: int, right: int) void = {
  if (left < right) {
    let mid = (left + right) / 2;
    mergesort(arr, left, mid);
    mergesort(arr, mid + 1, right);
    merge(arr, left, mid, right);
  };
};

export fn main() void = {
  let arr: [6]int = [5, 2, 8, 1, 9, 3];
  mergesort(arr, 0, 5);
  fmt::println("{}");
};
