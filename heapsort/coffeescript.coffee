heapify = (arr, n, i) ->
  largest = i
  left = 2 * i + 1
  right = 2 * i + 2
  largest = left if left < n and arr[left] > arr[largest]
  largest = right if right < n and arr[right] > arr[largest]
  if largest isnt i
    [arr[i], arr[largest]] = [arr[largest], arr[i]]
    heapify arr, n, largest

heapsort = (arr) ->
  n = arr.length
  heapify arr, n, i for i in [Math.floor(n / 2) - 1 .. 0] by -1
  for i in [n - 1 .. 1] by -1
    [arr[0], arr[i]] = [arr[i], arr[0]]
    heapify arr, i, 0
  arr

arr = [12, 11, 13, 5, 6, 7]
console.log heapsort arr
