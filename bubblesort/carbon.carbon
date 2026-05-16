package BubbleSort api;

fn BubbleSort(arr: [i32; 7]) -> [i32; 7] {
  var a: [i32; 7] = arr;
  var n: i32 = 7;
  var swapped: bool = true;
  while (swapped) {
    swapped = false;
    var i: i32 = 0;
    while (i < n - 1) {
      if (a[i] > a[i + 1]) {
        var tmp: i32 = a[i];
        a[i] = a[i + 1];
        a[i + 1] = tmp;
        swapped = true;
      }
      i = i + 1;
    }
    n = n - 1;
  }
  return a;
}

fn Main() -> i32 {
  var arr: [i32; 7] = (64, 34, 25, 12, 22, 11, 90);
  var sorted: [i32; 7] = BubbleSort(arr);
  return 0;
}
