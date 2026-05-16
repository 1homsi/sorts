package InsertionSort api;

fn InsertionSort(arr: [i32]) -> [i32] {
  var result: [i32] = arr;
  var n: i32 = result.size();
  var i: i32 = 1;
  while (i < n) {
    var key: i32 = result[i];
    var j: i32 = i - 1;
    while (j >= 0 and result[j] > key) {
      result[j + 1] = result[j];
      j = j - 1;
    }
    result[j + 1] = key;
    i = i + 1;
  }
  return result;
}
