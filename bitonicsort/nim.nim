proc compareAndSwap(arr: var seq[int], i, j: int, direction: bool) =
  if direction == (arr[i] > arr[j]):
    swap(arr[i], arr[j])

proc bitonicMerge(arr: var seq[int], lo, cnt: int, direction: bool) =
  if cnt > 1:
    let k = cnt div 2
    for i in lo ..< lo + k:
      compareAndSwap(arr, i, i + k, direction)
    bitonicMerge(arr, lo, k, direction)
    bitonicMerge(arr, lo + k, k, direction)

proc bitonicSort(arr: var seq[int], lo, cnt: int, direction: bool) =
  if cnt > 1:
    let k = cnt div 2
    bitonicSort(arr, lo, k, true)
    bitonicSort(arr, lo + k, k, false)
    bitonicMerge(arr, lo, cnt, direction)

var data = @[3, 7, 4, 8, 6, 2, 1, 5]
bitonicSort(data, 0, data.len, true)
echo data
