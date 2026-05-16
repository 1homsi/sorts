fun cycle_sort(arr: Array[Int]): Array[Int] do
  var n = arr.length
  var pos = 0
  while pos < n do
    var item = arr[pos]
    var cycles = 0
    for i in [0..n[ do
      if i != pos and arr[i] < item then
        cycles = cycles + 1
      end
    end
    if cycles != 0 then
      while arr[pos] == item do
        pos = pos + 1
      end
      var temp = arr[pos]
      arr[pos] = item
      item = temp
      while cycles > 0 do
        cycles = 0
        for i in [0..n[ do
          if i != pos and arr[i] < item then
            cycles = cycles + 1
          end
        end
        while arr[pos] == item do
          pos = pos + 1
        end
        temp = arr[pos]
        arr[pos] = item
        item = temp
        cycles = cycles - 1
      end
    end
    pos = pos + 1
  end
  return arr
end

var result = cycle_sort([5, 2, 8, 1, 9, 3])
print result
