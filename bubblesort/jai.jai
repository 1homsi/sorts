main :: () {
  arr := int.[5, 2, 8, 1, 9, 3];
  n := arr.count;
  for i: 0..n-1 {
    for j: 0..(n - 1 - i - 1) {
      if arr[j] > arr[j+1] {
        temp := arr[j];
        arr[j] = arr[j+1];
        arr[j+1] = temp;
      }
    }
  }
  print(arr);
}