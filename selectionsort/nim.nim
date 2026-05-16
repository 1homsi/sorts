proc selectionSort(arr: var seq[int]) =
  let n = arr.len
  for i in 0 ..< n:
    var minIdx = i
    for j in i + 1 ..< n:
      if arr[j] < arr[minIdx]:
        minIdx = j
    swap(arr[i], arr[minIdx])
