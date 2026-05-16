package MergeSort api;

fn Merge(left: [i32], right: [i32]) -> [i32] {
  var result: [i32] = {};
  var i: i32 = 0;
  var j: i32 = 0;
  while (i < left.size() and j < right.size()) {
    if (left[i] <= right[j]) {
      result.push_back(left[i]);
      i = i + 1;
    } else {
      result.push_back(right[j]);
      j = j + 1;
    }
  }
  while (i < left.size()) { result.push_back(left[i]); i = i + 1; }
  while (j < right.size()) { result.push_back(right[j]); j = j + 1; }
  return result;
}

fn MergeSort(arr: [i32]) -> [i32] {
  if (arr.size() <= 1) { return arr; }
  var mid: i32 = arr.size() / 2;
  var left: [i32] = MergeSort(arr[:mid]);
  var right: [i32] = MergeSort(arr[mid:]);
  return Merge(left, right);
}

fn Main() -> i32 {
  var arr: [i32] = {38, 27, 43, 3, 9, 82, 10};
  var sorted: [i32] = MergeSort(arr);
  return 0;
}
