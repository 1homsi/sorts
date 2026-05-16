merge :: (arr: []int, left: int, mid: int, right: int) {
  i := left
  j := mid + 1
  result := make([]int, right - left + 1)
  k := 0
  
  for i <= mid && j <= right {
    if arr[i] <= arr[j] {
      result[k] = arr[i]
      i += 1
    } else {
      result[k] = arr[j]
      j += 1
    }
    k += 1
  }
  
  for i <= mid {
    result[k] = arr[i]
    i += 1
    k += 1
  }
  
  for j <= right {
    result[k] = arr[j]
    j += 1
    k += 1
  }
  
  for k = 0; k < len(result); k += 1 {
    arr[left + k] = result[k]
  }
}

mergesort :: (arr: []int, left: int, right: int) {
  if left < right {
    mid := (left + right) / 2
    mergesort(arr, left, mid)
    mergesort(arr, mid + 1, right)
    merge(arr, left, mid, right)
  }
}

main :: () {
  arr := [5, 2, 8, 1, 9, 3]
  mergesort(arr, 0, 5)
  print(arr)
}
