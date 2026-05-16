flip = (arr, k) ->
  left = 0; right = k
  while left < right
    [arr[left], arr[right]] = [arr[right], arr[left]]
    left++; right--

pancakeSort = (arr) ->
  size = arr.length
  while size > 1
    maxIdx = 0
    for i in [1...size]
      maxIdx = i if arr[i] > arr[maxIdx]
    if maxIdx isnt size - 1
      flip arr, maxIdx unless maxIdx is 0
      flip arr, size - 1
    size--
  arr

arr = [3, 6, 2, 7, 4, 1, 5]
console.log pancakeSort arr
