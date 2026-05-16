package Bogosort api;

import Core library "io";
import Core library "random";

fn IsSorted(arr: [i32; 8]) -> bool {
  var i: i32 = 0;
  while (i < 7) {
    if (arr[i] > arr[i + 1]) {
      return false;
    }
    i = i + 1;
  }
  return true;
}

fn Shuffle(arr: [i32; 8]*) {
  var i: i32 = 7;
  while (i > 0) {
    var j: i32 = Random.Int(0, i);
    var tmp: i32 = (*arr)[i];
    (*arr)[i] = (*arr)[j];
    (*arr)[j] = tmp;
    i = i - 1;
  }
}

fn Main() -> i32 {
  var arr: [i32; 8] = (3, 1, 4, 1, 5, 9, 2, 6);
  while (!IsSorted(arr)) {
    Shuffle(&arr);
  }
  Core.Print(arr);
  return 0;
}
