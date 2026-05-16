define cyclesort(arr) {
  var n = len(arr)
  var pos = 0
  while (pos < n) {
    var item = arr(pos)
    var cycles = 0
    for (var i = 0; i < n; i++) {
      if (i != pos && arr(i) < item) {
        cycles = cycles + 1
      }
    }
    if (cycles != 0) {
      while (arr(pos) == item) {
        pos = pos + 1
      }
      var temp = arr(pos)
      arr(pos) = item
      item = temp
      while (cycles > 0) {
        cycles = 0
        for (var i = 0; i < n; i++) {
          if (i != pos && arr(i) < item) {
            cycles = cycles + 1
          }
        }
        while (arr(pos) == item) {
          pos = pos + 1
        }
        temp = arr(pos)
        arr(pos) = item
        item = temp
        cycles = cycles - 1
      }
    }
    pos = pos + 1
  }
  return arr
}

print(cyclesort([5, 2, 8, 1, 9, 3]))
