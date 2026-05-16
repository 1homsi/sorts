compareAndSwap = (arr, i, j, direction) ->
  if direction == (arr[i] > arr[j])
    [arr[i], arr[j]] = [arr[j], arr[i]]

bitonicMerge = (arr, lo, cnt, direction) ->
  if cnt > 1
    k = Math.floor cnt / 2
    for i in [lo...lo + k]
      compareAndSwap arr, i, i + k, direction
    bitonicMerge arr, lo, k, direction
    bitonicMerge arr, lo + k, k, direction

bitonicSort = (arr, lo, cnt, direction) ->
  if cnt > 1
    k = Math.floor cnt / 2
    bitonicSort arr, lo, k, true
    bitonicSort arr, lo + k, k, false
    bitonicMerge arr, lo, cnt, direction

data = [3, 7, 4, 8, 6, 2, 1, 5]
bitonicSort data, 0, data.length, true
console.log data
