comb_sort :: (arr: [..]int) {
  gap := arr.count
  swapped := true
  while gap > 1 || swapped {
    gap = cast(int)(gap * 10 / 13)
    if gap < 1 gap = 1
    swapped = false
    for i := 0; i < arr.count - gap; i += 1 {
      if arr[i] > arr[i + gap] {
        temp := arr[i]
        arr[i] = arr[i + gap]
        arr[i + gap] = temp
        swapped = true
      }
    }
  }
}

main :: () {
  sample := int.[5, 2, 8, 1, 9, 3]
  comb_sort(sample)
  for sample print(it)
}
