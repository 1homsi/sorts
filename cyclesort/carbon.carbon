package CycleSort api;

fn CycleSort(arr: [i32; 5]) -> [i32; 5] {
  var a: [i32; 5] = arr;
  var n: i32 = 5;
  var writes: i32 = 0;
  var cycle_start: i32 = 0;
  while (cycle_start < n - 1) {
    var item: i32 = a[cycle_start];
    var pos: i32 = cycle_start;
    var i: i32 = cycle_start + 1;
    while (i < n) {
      if (a[i] < item) { pos = pos + 1; }
      i = i + 1;
    }
    if (pos != cycle_start) {
      while (item == a[pos]) { pos = pos + 1; }
      var tmp: i32 = a[pos];
      a[pos] = item;
      item = tmp;
      writes = writes + 1;
      while (pos != cycle_start) {
        pos = cycle_start;
        i = cycle_start + 1;
        while (i < n) {
          if (a[i] < item) { pos = pos + 1; }
          i = i + 1;
        }
        while (item == a[pos]) { pos = pos + 1; }
        tmp = a[pos];
        a[pos] = item;
        item = tmp;
        writes = writes + 1;
      }
    }
    cycle_start = cycle_start + 1;
  }
  return a;
}
