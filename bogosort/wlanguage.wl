bogosort(arr) {
  while (! issorted(arr)) {
    shuffle(arr)
  }
  return arr
}

issorted(arr) {
  for (i = 1; i < ArrayCount(arr); i++) {
    if (arr[i] > arr[i+1]) {
      return false
    }
  }
  return true
}

shuffle(arr) {
  for (i = 1; i <= ArrayCount(arr); i++) {
    j = Random(ArrayCount(arr))
    tmp = arr[i]
    arr[i] = arr[j]
    arr[j] = tmp
  }
}

arr = [3, 1, 2]
Info(bogosort(arr))
