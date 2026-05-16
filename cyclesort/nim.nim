proc cycleSort(arr: var seq[int]): int =
  var writes = 0
  let n = arr.len
  for cycleStart in 0 ..< n - 1:
    var item = arr[cycleStart]
    var pos = cycleStart
    for i in cycleStart + 1 ..< n:
      if arr[i] < item: inc pos
    if pos == cycleStart: continue
    while item == arr[pos]: inc pos
    swap(arr[pos], item)
    inc writes
    while pos != cycleStart:
      pos = cycleStart
      for i in cycleStart + 1 ..< n:
        if arr[i] < item: inc pos
      while item == arr[pos]: inc pos
      swap(arr[pos], item)
      inc writes
  writes

var arr = @[5, 4, 3, 2, 1]
discard cycleSort(arr)
echo arr
