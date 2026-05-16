SelectionSort: class {
  sort: static func (arr: Int[]) -> Int[] {
    n := arr length
    for (i in 0..n-2) {
      min_idx := i
      for (j in i+1..n-1) {
        if (arr[j] < arr[min_idx]) {
          min_idx = j
        }
      }
      tmp := arr[i]
      arr[i] = arr[min_idx]
      arr[min_idx] = tmp
    }
    return arr
  }
}

arr := [5, 2, 8, 1, 9, 3] as Int[]
arr = SelectionSort sort(arr)
arr println()