import std/sequtils

proc countingSort(arr: var seq[int], exp: int) =
  let n = arr.len
  var output = newSeq[int](n)
  var count = newSeq[int](10)
  for x in arr: count[(x div exp) mod 10] += 1
  for i in 1..9: count[i] += count[i-1]
  for i in countdown(n-1, 0):
    let idx = (arr[i] div exp) mod 10
    dec count[idx]
    output[count[idx]] = arr[i]
  arr = output

proc radixSort(arr: var seq[int]) =
  if arr.len == 0: return
  let max = foldl(arr, max(a, b))
  var exp = 1
  while max div exp > 0:
    countingSort(arr, exp)
    exp *= 10

var arr = @[170, 45, 75, 90, 802, 24, 2, 66]
radixSort(arr)
echo arr
