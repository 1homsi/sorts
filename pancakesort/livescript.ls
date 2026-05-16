flip = (arr, k) ->
  left = 0; right = k
  while left < right
    [arr[left], arr[right]] = [arr[right], arr[left]]
    left++; right--

find-max-idx = (arr, size) ->
  max-idx = 0
  for i from 1 to size - 1
    if arr[i] > arr[max-idx] then max-idx = i
  max-idx

pancake-sort = (arr) ->
  size = arr.length
  while size > 1
    mi = find-max-idx arr, size
    if mi isnt size - 1
      flip arr, mi unless mi is 0
      flip arr, size - 1
    size--
  arr

arr = [3, 6, 2, 7, 4, 1, 5]
console.log pancake-sort arr
