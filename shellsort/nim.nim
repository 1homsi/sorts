proc shellSort(arr: var seq[int]) =
  let n = arr.len
  var gap = n div 2
  while gap > 0:
    for i in gap..<n:
      let temp = arr[i]
      var j = i
      while j >= gap and arr[j - gap] > temp:
        arr[j] = arr[j - gap]
        j -= gap
      arr[j] = temp
    gap = gap div 2

var arr = @[64, 34, 25, 12, 22, 11, 90]
shellSort(arr)
echo arr
