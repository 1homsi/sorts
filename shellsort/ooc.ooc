shellsort: func (arr: Int[]) -> Int[] {
  gap := 1
  while (gap <= arr length) {
    gap = gap * 3 + 1
  }
  while (gap > 0) {
    gap = gap / 3
    for (i in gap..arr length) {
      temp := arr[i]
      j := i
      while (j >= gap && arr[j - gap] > temp) {
        arr[j] = arr[j - gap]
        j -= gap
      }
      arr[j] = temp
    }
  }
  return arr
}
arr := [5, 2, 8, 1, 9, 3] as Int[]
"%(shellsort(arr))" println()
