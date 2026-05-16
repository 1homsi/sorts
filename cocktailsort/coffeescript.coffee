cocktailSort = (arr) ->
  swapped = true
  start = 0
  end = arr.length - 1
  while swapped
    swapped = false
    for i in [start...end]
      if arr[i] > arr[i + 1]
        [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]]
        swapped = true
    break unless swapped
    swapped = false
    end--
    for i in [end - 1..start] by -1
      if arr[i] > arr[i + 1]
        [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]]
        swapped = true
    start++
  arr
