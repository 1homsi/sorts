proc bubbleSort(arr: var seq[int]) =
  var n = arr.len
  var swapped = true
  while swapped:
    swapped = false
    for i in 0 ..< n - 1:
      if arr[i] > arr[i + 1]:
        swap(arr[i], arr[i + 1])
        swapped = true
    dec n

var arr = @[64, 34, 25, 12, 22, 11, 90]
bubbleSort(arr)
echo arr
