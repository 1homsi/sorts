countingSort = (arr, exp) ->
  n = arr.length
  output = new Array(n).fill(0)
  count = new Array(10).fill(0)
  for x in arr
    count[Math.floor(x / exp) % 10]++
  for i in [1..9]
    count[i] += count[i - 1]
  for i in [n-1..0] by -1
    idx = Math.floor(arr[i] / exp) % 10
    output[--count[idx]] = arr[i]
  for i in [0...n]
    arr[i] = output[i]

radixSort = (arr) ->
  return arr unless arr.length
  max = Math.max(arr...)
  exp = 1
  while Math.floor(max / exp) > 0
    countingSort(arr, exp)
    exp *= 10
  arr

arr = [170, 45, 75, 90, 802, 24, 2, 66]
console.log radixSort(arr)
