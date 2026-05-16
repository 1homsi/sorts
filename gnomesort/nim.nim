proc gnomeSort(arr: var seq[int]) =
  var i = 0
  while i < arr.len:
    if i == 0 or arr[i] >= arr[i - 1]:
      inc i
    else:
      swap(arr[i], arr[i - 1])
      dec i
