insertionSort :: (arr: [6]int) -> [6]int #must_inline {
  result := arr;
  for i: 1..6 {
    key := result[i];
    j := i - 1;
    while j >= 0 && result[j] > key {
      result[j+1] = result[j];
      j -= 1;
    }
    result[j+1] = key;
  }
  return result;
}

main :: () {
  arr := [6]int.[5, 2, 8, 1, 9, 3];
  print(insertionSort(arr));
}