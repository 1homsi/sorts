let shellsort = fn(arr) {
  let n = len(arr)
  let gap = 1
  while gap <= n {
    gap = gap * 3 + 1
  }
  while gap > 0 {
    gap = gap / 3
    for i in range(gap, n) {
      let temp = arr[i]
      let j = i
      while j >= gap && arr[j - gap] > temp {
        arr[j] = arr[j - gap]
        j -= gap
      }
      arr[j] = temp
    }
  }
  arr
}
print(shellsort([5, 2, 8, 1, 9, 3]))
