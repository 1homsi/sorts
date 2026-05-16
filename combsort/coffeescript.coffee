combSort = (arr) ->
  n = arr.length
  gap = n
  shrink = 1.3
  sorted = false
  until sorted
    gap = Math.floor gap / shrink
    if gap <= 1
      gap = 1
      sorted = true
    for i in [0...n - gap]
      if arr[i] > arr[i + gap]
        [arr[i], arr[i + gap]] = [arr[i + gap], arr[i]]
        sorted = false
  arr
