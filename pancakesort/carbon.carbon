package PancakeSort api;

fn Flip(arr: [i32; 7]*, k: i32) {
  var left: i32 = 0;
  var right: i32 = k;
  while (left < right) {
    var tmp: i32 = (*arr)[left];
    (*arr)[left] = (*arr)[right];
    (*arr)[right] = tmp;
    left = left + 1;
    right = right - 1;
  }
}

fn PancakeSort(arr: [i32; 7]*) {
  var size: i32 = 7;
  while (size > 1) {
    var max_idx: i32 = 0;
    var i: i32 = 1;
    while (i < size) {
      if ((*arr)[i] > (*arr)[max_idx]) {
        max_idx = i;
      }
      i = i + 1;
    }
    if (max_idx != size - 1) {
      if (max_idx != 0) { Flip(arr, max_idx); }
      Flip(arr, size - 1);
    }
    size = size - 1;
  }
}

fn Run() {
  var arr: [i32; 7] = (3, 6, 2, 7, 4, 1, 5);
  PancakeSort(&arr);
}
