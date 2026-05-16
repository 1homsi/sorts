package BucketSort api;

import Core library "io";
import Core library "array";

fn InsertionSort(bucket: Array(f64)*) {
  var n: i32 = bucket->size();
  var i: i32 = 1;
  while (i < n) {
    var key: f64 = (*bucket)[i];
    var j: i32 = i - 1;
    while (j >= 0 and (*bucket)[j] > key) {
      (*bucket)[j + 1] = (*bucket)[j];
      j = j - 1;
    }
    (*bucket)[j + 1] = key;
    i = i + 1;
  }
}

fn BucketSort(arr: Array(f64)) -> Array(f64) {
  var n: i32 = arr.size();
  if (n == 0) { return arr; }
  var min_v: f64 = arr[0];
  var max_v: f64 = arr[0];
  var i: i32 = 0;
  while (i < n) {
    if (arr[i] < min_v) { min_v = arr[i]; }
    if (arr[i] > max_v) { max_v = arr[i]; }
    i = i + 1;
  }
  var buckets: Array(Array(f64)) = Array(Array(f64)).Make(n);
  i = 0;
  while (i < n) {
    var num: f64 = arr[i];
    var idx: i32 = Cast(f64 -> i32)((num - min_v) / (max_v - min_v + 1.0) * Cast(i32 -> f64)(n));
    if (idx >= n) { idx = n - 1; }
    buckets[idx].push(num);
    i = i + 1;
  }
  var result: Array(f64) = Array(f64).Make(0);
  i = 0;
  while (i < n) {
    InsertionSort(&buckets[i]);
    result.append(buckets[i]);
    i = i + 1;
  }
  return result;
}

fn Main() -> i32 {
  var data: Array(f64) = (0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68);
  var sorted: Array(f64) = BucketSort(data);
  Core.IO.Print(sorted);
  return 0;
}
