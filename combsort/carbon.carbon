package CombSort api;

fn CombSort(arr: [i32]) -> [i32] {
  var n: i32 = arr.size();
  var gap: i32 = n;
  var sorted: bool = false;
  while (!sorted) {
    gap = (gap * 10) / 13;
    if (gap <= 1) {
      gap = 1;
      sorted = true;
    }
    var i: i32 = 0;
    while (i + gap < n) {
      if (arr[i] > arr[i + gap]) {
        var tmp: i32 = arr[i];
        arr[i] = arr[i + gap];
        arr[i + gap] = tmp;
        sorted = false;
      }
      i = i + 1;
    }
  }
  return arr;
}
