bubble-sort = (arr) ->
  n = arr.length
  loop
    swapped = false
    for i from 0 to n - 2
      if arr[i] > arr[i + 1]
        [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]]
        swapped = true
    n--
    break unless swapped
  arr

arr = [64, 34, 25, 12, 22, 11, 90]
console.log bubble-sort arr
