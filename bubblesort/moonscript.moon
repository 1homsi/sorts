bubble_sort = (arr) ->
  n = #arr
  swapped = true
  while swapped
    swapped = false
    for i = 1, n - 1
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swapped = true
    n -= 1
  arr

arr = {64, 34, 25, 12, 22, 11, 90}
bubble_sort arr
print table.concat arr, " "
