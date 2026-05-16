proc partition(arr: var seq[int], low, high: int): int =
  let pivot = arr[high]
  var i = low
  for j in low ..< high:
    if arr[j] <= pivot:
      swap(arr[i], arr[j])
      inc i
  swap(arr[i], arr[high])
  i

proc quicksort(arr: var seq[int], low, high: int) =
  if low < high:
    let p = partition(arr, low, high)
    quicksort(arr, low, p - 1)
    quicksort(arr, p + 1, high)

var arr = @[3, 6, 8, 10, 1, 2, 1]
quicksort(arr, 0, arr.len - 1)
echo arr
