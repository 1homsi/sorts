package Heapsort api;

fn Heapify(arr: [i32; 6]*, n: i32, i: i32) {
  var largest: i32 = i;
  var left: i32 = 2 * i + 1;
  var right: i32 = 2 * i + 2;
  if (left < n and (*arr)[left] > (*arr)[largest]) { largest = left; }
  if (right < n and (*arr)[right] > (*arr)[largest]) { largest = right; }
  if (largest != i) {
    var tmp: i32 = (*arr)[i];
    (*arr)[i] = (*arr)[largest];
    (*arr)[largest] = tmp;
    Heapify(arr, n, largest);
  }
}

fn Heapsort(arr: [i32; 6]*) {
  var n: i32 = 6;
  var i: i32 = n / 2 - 1;
  while (i >= 0) { Heapify(arr, n, i); --i; }
  i = n - 1;
  while (i > 0) {
    var tmp: i32 = (*arr)[0];
    (*arr)[0] = (*arr)[i];
    (*arr)[i] = tmp;
    Heapify(arr, i, 0);
    --i;
  }
}

fn Main() -> i32 {
  var arr: [i32; 6] = (12, 11, 13, 5, 6, 7);
  Heapsort(&arr);
  return 0;
}
