package CocktailSort api;

fn CocktailSort(arr: [i32]) -> [i32] {
  var a: [i32] = arr;
  var swapped: bool = true;
  var start: i32 = 0;
  var end: i32 = a.size() - 1;
  while (swapped) {
    swapped = false;
    var i: i32 = start;
    while (i < end) {
      if (a[i] > a[i + 1]) {
        var tmp: i32 = a[i];
        a[i] = a[i + 1];
        a[i + 1] = tmp;
        swapped = true;
      }
      i = i + 1;
    }
    if (!swapped) { break; }
    swapped = false;
    end = end - 1;
    var j: i32 = end - 1;
    while (j >= start) {
      if (a[j] > a[j + 1]) {
        var tmp: i32 = a[j];
        a[j] = a[j + 1];
        a[j + 1] = tmp;
        swapped = true;
      }
      j = j - 1;
    }
    start = start + 1;
  }
  return a;
}
