package RadixSort api;

fn CountingSort(arr: [i32; 8], exp: i32) -> [i32; 8] {
  var output: [i32; 8] = (0, 0, 0, 0, 0, 0, 0, 0);
  var count: [i32; 10] = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  var i: i32 = 0;
  while (i < 8) {
    var idx: i32 = (arr[i] / exp) % 10;
    count[idx] = count[idx] + 1;
    i = i + 1;
  }
  var j: i32 = 1;
  while (j < 10) {
    count[j] = count[j] + count[j - 1];
    j = j + 1;
  }
  var k: i32 = 7;
  while (k >= 0) {
    var idx: i32 = (arr[k] / exp) % 10;
    count[idx] = count[idx] - 1;
    output[count[idx]] = arr[k];
    k = k - 1;
  }
  return output;
}

fn RadixSort(arr: [i32; 8]) -> [i32; 8] {
  var max: i32 = arr[0];
  var i: i32 = 1;
  while (i < 8) {
    if (arr[i] > max) { max = arr[i]; }
    i = i + 1;
  }
  var result: [i32; 8] = arr;
  var exp: i32 = 1;
  while (max / exp > 0) {
    result = CountingSort(result, exp);
    exp = exp * 10;
  }
  return result;
}

fn Main() -> i32 {
  var arr: [i32; 8] = (170, 45, 75, 90, 802, 24, 2, 66);
  var sorted: [i32; 8] = RadixSort(arr);
  return 0;
}
