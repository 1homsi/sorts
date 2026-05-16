BubbleSort: class {
  sort: static func (arr: Int[]) -> Int[] {
    n := arr length
    for (i in 0..n) {
      for (j in 0..(n - 1 - i)) {
        if (arr[j] > arr[j + 1]) {
          temp := arr[j]
          arr[j] = arr[j + 1]
          arr[j + 1] = temp
        }
      }
    }
    return arr
  }
}

arr := [5, 2, 8, 1, 9, 3] as Int[]
result := BubbleSort sort(arr)
result println()