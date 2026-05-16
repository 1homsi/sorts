bubbleSort = (arr) ->
  n = arr.length
  loop
    swapped = false
    for i in [0...n-1]
      if arr[i] > arr[i+1]
        [arr[i], arr[i+1]] = [arr[i+1], arr[i]]
        swapped = true
    n--
    break unless swapped
  arr

arr = [64, 34, 25, 12, 22, 11, 90]
console.log bubbleSort arr
