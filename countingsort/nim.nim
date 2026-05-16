proc countingSort(arr: seq[int]): seq[int] =
  if arr.len == 0: return arr
  var minVal = arr[0]
  var maxVal = arr[0]
  for v in arr:
    if v < minVal: minVal = v
    if v > maxVal: maxVal = v
  let range = maxVal - minVal + 1
  var count = newSeq[int](range)
  for v in arr: inc count[v - minVal]
  for i in 1 ..< range: count[i] += count[i - 1]
  result = newSeq[int](arr.len)
  for i in countdown(arr.len - 1, 0):
    dec count[arr[i] - minVal]
    result[count[arr[i] - minVal]] = arr[i]

echo countingSort(@[4, 2, 2, 8, 3, 3, 1])
