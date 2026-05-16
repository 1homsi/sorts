Merge: func(arr: Int[], left: Int, mid: Int, right: Int) {
  i := left
  j := mid + 1
  result := Int[](right - left + 1)
  k := 0
  
  while (i <= mid && j <= right) {
    if (arr[i] <= arr[j]) {
      result[k] = arr[i]
      i += 1
    } else {
      result[k] = arr[j]
      j += 1
    }
    k += 1
  }
  
  while (i <= mid) {
    result[k] = arr[i]
    i += 1
    k += 1
  }
  
  while (j <= right) {
    result[k] = arr[j]
    j += 1
    k += 1
  }
  
  for (k = 0; k < result length; k += 1) {
    arr[left + k] = result[k]
  }
}

MergeSort: func(arr: Int[], left: Int, right: Int) {
  if (left < right) {
    mid := (left + right) / 2
    MergeSort(arr, left, mid)
    MergeSort(arr, mid + 1, right)
    Merge(arr, left, mid, right)
  }
}

arr := [5, 2, 8, 1, 9, 3] as Int[]
MergeSort(arr, 0, 5)
arr println()
