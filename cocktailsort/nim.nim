proc cocktailSort(arr: var seq[int]) =
  var swapped = true
  var start = 0
  var ending = arr.len - 1
  while swapped:
    swapped = false
    for i in start ..< ending:
      if arr[i] > arr[i + 1]:
        swap(arr[i], arr[i + 1])
        swapped = true
    if not swapped:
      break
    swapped = false
    dec ending
    for i in countdown(ending - 1, start):
      if arr[i] > arr[i + 1]:
        swap(arr[i], arr[i + 1])
        swapped = true
    inc start
