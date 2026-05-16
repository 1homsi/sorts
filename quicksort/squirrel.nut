function quicksort(arr) {
  if (arr.len() <= 1) return arr;
  local pivot = arr[0];
  local less = [];
  local greater = [];
  for (local i = 1; i < arr.len(); i++) {
    if (arr[i] <= pivot) {
      less.push(arr[i]);
    } else {
      greater.push(arr[i]);
    }
  }
  local result = [];
  foreach (x in quicksort(less)) result.push(x);
  result.push(pivot);
  foreach (x in quicksort(greater)) result.push(x);
  return result;
}

print(quicksort([5, 2, 8, 1, 9, 3]));