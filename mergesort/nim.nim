proc merge(left, right: seq[int]): seq[int] =
  var i, j = 0
  while i < left.len and j < right.len:
    if left[i] <= right[j]:
      result.add(left[i])
      inc i
    else:
      result.add(right[j])
      inc j
  while i < left.len:
    result.add(left[i])
    inc i
  while j < right.len:
    result.add(right[j])
    inc j

proc mergeSort(arr: seq[int]): seq[int] =
  if arr.len <= 1:
    return arr
  let mid = arr.len div 2
  let left = mergeSort(arr[0..<mid])
  let right = mergeSort(arr[mid..^1])
  return merge(left, right)

let arr = @[38, 27, 43, 3, 9, 82, 10]
echo mergeSort(arr)
