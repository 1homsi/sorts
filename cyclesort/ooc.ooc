cycleSort: func(arr: Int[]) -> Int[] {
  n := arr length
  pos := 0
  while (pos < n) {
    item := arr[pos]
    cycles := 0
    for (i in 0..n-1) {
      if (i != pos && arr[i] < item) {
        cycles += 1
      }
    }
    if (cycles != 0) {
      while (arr[pos] == item) {
        pos += 1
      }
      temp := arr[pos]
      arr[pos] = item
      item = temp
      while (cycles > 0) {
        cycles = 0
        for (i in 0..n-1) {
          if (i != pos && arr[i] < item) {
            cycles += 1
          }
        }
        while (arr[pos] == item) {
          pos += 1
        }
        temp = arr[pos]
        arr[pos] = item
        item = temp
        cycles -= 1
      }
    }
    pos += 1
  }
  arr
}

result := cycleSort([5, 2, 8, 1, 9, 3] as Int[])
result println()
