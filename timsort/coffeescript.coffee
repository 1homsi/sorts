MIN_RUN = 32

insertionSort = (arr, left, right) ->
  for i in [left+1..right]
    key = arr[i]
    j = i - 1
    while j >= left and arr[j] > key
      arr[j+1] = arr[j]
      j--
    arr[j+1] = key

merge = (arr, left, mid, right) ->
  leftPart = arr[left..mid]
  rightPart = arr[mid+1..right]
  i = 0; j = 0; k = left
  while i < leftPart.length and j < rightPart.length
    if leftPart[i] <= rightPart[j]
      arr[k++] = leftPart[i++]
    else
      arr[k++] = rightPart[j++]
  while i < leftPart.length then arr[k++] = leftPart[i++]
  while j < rightPart.length then arr[k++] = rightPart[j++]

timsort = (arr) ->
  n = arr.length
  i = 0
  while i < n
    insertionSort arr, i, Math.min(i + MIN_RUN - 1, n - 1)
    i += MIN_RUN
  size = MIN_RUN
  while size < n
    left = 0
    while left < n
      mid = Math.min(left + size - 1, n - 1)
      right = Math.min(left + 2 * size - 1, n - 1)
      merge arr, left, mid, right if mid < right
      left += 2 * size
    size *= 2
  arr

arr = [5, 2, 8, 1, 9, 3, 7, 4, 6]
console.log timsort(arr)
