gnomeSort = (arr) ->
  i = 0
  while i < arr.length
    if i is 0 or arr[i] >= arr[i - 1]
      i++
    else
      [arr[i], arr[i - 1]] = [arr[i - 1], arr[i]]
      i--
  arr
