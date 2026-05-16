proc insertionSort(arr: var seq[int]) =
  for i in 1 ..< arr.len:
    let key = arr[i]
    var j = i - 1
    while j >= 0 and arr[j] > key:
      arr[j + 1] = arr[j]
      j -= 1
    arr[j + 1] = key
