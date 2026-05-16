package BitonicSort api;

fn CompareAndSwap(arr: *[i32], i: i32, j: i32, direction: bool) {
  if direction == (arr[i] > arr[j]) {
    var tmp: i32 = arr[i];
    arr[i] = arr[j];
    arr[j] = tmp;
  }
}

fn BitonicMerge(arr: *[i32], lo: i32, cnt: i32, direction: bool) {
  if cnt > 1 {
    var k: i32 = cnt / 2;
    var i: i32 = lo;
    while i < lo + k {
      CompareAndSwap(arr, i, i + k, direction);
      i = i + 1;
    }
    BitonicMerge(arr, lo, k, direction);
    BitonicMerge(arr, lo + k, k, direction);
  }
}

fn BitonicSort(arr: *[i32], lo: i32, cnt: i32, direction: bool) {
  if cnt > 1 {
    var k: i32 = cnt / 2;
    BitonicSort(arr, lo, k, true);
    BitonicSort(arr, lo + k, k, false);
    BitonicMerge(arr, lo, cnt, direction);
  }
}

fn Run() -> i32 {
  var data: [i32] = (3, 7, 4, 8, 6, 2, 1, 5);
  BitonicSort(&data, 0, 8, true);
  return 0;
}
