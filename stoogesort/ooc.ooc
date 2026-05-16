stoogesort: func(a: Int[], i: Int, j: Int) {
  if (a[j] < a[i]) {
    temp := a[j]
    a[j] = a[i]
    a[i] = temp
  }
  if (j - i > 1) {
    t := (j - i + 1) / 3
    stoogesort(a, i, j - t)
    stoogesort(a, i + t, j)
    stoogesort(a, i, j - t)
  }
}

arr := [5, 2, 8, 1, 9, 3]
stoogesort(arr, 0, 5)
arr print()
