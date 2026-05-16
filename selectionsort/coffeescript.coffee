selectionSort = (arr) ->
  n = arr.length
  for i in [0...n]
    minIdx = i
    for j in [i+1...n]
      minIdx = j if arr[j] < arr[minIdx]
    [arr[i], arr[minIdx]] = [arr[minIdx], arr[i]]
  arr
