package GnomeSort api;

fn GnomeSort(arr: [i32]) -> [i32] {
  var i: i32 = 0;
  var n: i32 = arr.size();
  while (i < n) {
    if (i == 0 or arr[i] >= arr[i - 1]) {
      i = i + 1;
    } else {
      var tmp: i32 = arr[i];
      arr[i] = arr[i - 1];
      arr[i - 1] = tmp;
      i = i - 1;
    }
  }
  return arr;
}
