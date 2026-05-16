package Quicksort api;

fn Partition(arr: [i32; 7]*, low: i32, high: i32) -> i32 {
  var pivot: i32 = (*arr)[high];
  var i: i32 = low;
  var j: i32 = low;
  while (j < high) {
    if ((*arr)[j] <= pivot) {
      var tmp: i32 = (*arr)[i];
      (*arr)[i] = (*arr)[j];
      (*arr)[j] = tmp;
      i = i + 1;
    }
    j = j + 1;
  }
  var tmp: i32 = (*arr)[i];
  (*arr)[i] = (*arr)[high];
  (*arr)[high] = tmp;
  return i;
}

fn Quicksort(arr: [i32; 7]*, low: i32, high: i32) {
  if (low < high) {
    var p: i32 = Partition(arr, low, high);
    Quicksort(arr, low, p - 1);
    Quicksort(arr, p + 1, high);
  }
}
