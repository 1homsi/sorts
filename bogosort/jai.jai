bogosort :: (arr: [] int) -> [] int {
  while !issorted(arr) {
    shuffle(arr);
  }
  return arr;
}

issorted :: (arr: [] int) -> bool {
  for i in 0..(arr.count - 1) {
    if arr[i] > arr[i + 1] {
      return false;
    }
  }
  return true;
}

shuffle :: (arr: [] int) {
  for i in 0..arr.count {
    j := random(arr.count);
    tmp := arr[i];
    arr[i] = arr[j];
    arr[j] = tmp;
  }
}

main :: () {
  arr := int.[3, 1, 2];
  print(bogosort(arr));
}
