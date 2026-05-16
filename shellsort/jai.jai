main :: () {
  arr : [6]int = [5, 2, 8, 1, 9, 3];
  gap := 1;
  while gap <= 6 { gap = gap * 3 + 1; }
  while gap > 0 {
    gap = gap / 3;
    for i := gap; i < 6; i += 1 {
      temp := arr[i];
      j := i;
      while j >= gap && arr[j - gap] > temp {
        arr[j] = arr[j - gap];
        j -= gap;
      }
      arr[j] = temp;
    }
  }
  print(arr);
}
