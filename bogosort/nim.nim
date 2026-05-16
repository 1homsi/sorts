import random, sequtils

proc isSorted(arr: seq[int]): bool =
  for i in 0 ..< arr.len - 1:
    if arr[i] > arr[i + 1]: return false
  true

proc bogosort(arr: seq[int]): seq[int] =
  var a = arr
  while not isSorted(a):
    shuffle(a)
  a

randomize()
let arr = @[3, 1, 4, 1, 5, 9, 2, 6]
echo bogosort(arr)
