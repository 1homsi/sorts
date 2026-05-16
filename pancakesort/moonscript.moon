flip = (arr, k) ->
  left, right = 0, k
  while left < right
    arr[left], arr[right] = arr[right], arr[left]
    left += 1
    right -= 1

find_max_idx = (arr, size) ->
  max_idx = 0
  for i = 1, size - 1
    if arr[i] > arr[max_idx]
      max_idx = i
  max_idx

pancake_sort = (arr) ->
  size = #arr
  while size > 1
    mi = find_max_idx arr, size
    if mi != size - 1
      flip arr, mi unless mi == 0
      flip arr, size - 1
    size -= 1
  arr

arr = {3, 6, 2, 7, 4, 1, 5}
result = pancake_sort arr
print table.concat result, " "
