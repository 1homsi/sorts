proc combSort(arr: var seq[int]) =
  let n = arr.len
  var gap = n
  let shrink = 1.3
  var sorted = false
  while not sorted:
    gap = int(float(gap) / shrink)
    if gap <= 1:
      gap = 1
      sorted = true
    var i = 0
    while i + gap < n:
      if arr[i] > arr[i + gap]:
        swap(arr[i], arr[i + gap])
        sorted = false
      inc i
