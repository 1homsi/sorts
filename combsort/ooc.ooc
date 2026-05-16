CombSort: func(arr: Int*) -> Int* {
  gap := arr length
  swapped := true
  while (gap > 1 || swapped) {
    gap = gap * 10 / 13
    if (gap < 1) gap = 1
    swapped = false
    for (i in 0..arr length - gap) {
      if (arr[i] > arr[i + gap]) {
        temp := arr[i]
        arr[i] = arr[i + gap]
        arr[i + gap] = temp
        swapped = true
      }
    }
  }
  arr
}

sample := [5, 2, 8, 1, 9, 3] as Int*
CombSort(sample) println()
