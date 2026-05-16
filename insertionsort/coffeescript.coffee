insertionSort = (arr) ->
  for i in [1...arr.length]
    key = arr[i]
    j = i - 1
    while j >= 0 and arr[j] > key
      arr[j + 1] = arr[j]
      j--
    arr[j + 1] = key
  arr
