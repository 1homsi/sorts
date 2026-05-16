proc flip(arr: var seq[int], k: int) =
  var left = 0
  var right = k
  while left < right:
    swap(arr[left], arr[right])
    inc left; dec right

proc pancakeSort(arr: var seq[int]) =
  var size = arr.len
  while size > 1:
    var maxIdx = 0
    for i in 1..<size:
      if arr[i] > arr[maxIdx]:
        maxIdx = i
    if maxIdx != size - 1:
      if maxIdx != 0:
        flip(arr, maxIdx)
      flip(arr, size - 1)
    dec size

var arr = @[3, 6, 2, 7, 4, 1, 5]
pancakeSort(arr)
echo arr
