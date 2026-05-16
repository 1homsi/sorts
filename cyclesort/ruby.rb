def cycle_sort(arr)
  writes = 0
  n = arr.length
  (0...n - 1).each do |cycle_start|
    item = arr[cycle_start]
    pos = cycle_start
    (cycle_start + 1...n).each do |i|
      pos += 1 if arr[i] < item
    end
    next if pos == cycle_start
    pos += 1 while item == arr[pos]
    arr[pos], item = item, arr[pos]
    writes += 1
    while pos != cycle_start
      pos = cycle_start
      (cycle_start + 1...n).each do |i|
        pos += 1 if arr[i] < item
      end
      pos += 1 while item == arr[pos]
      arr[pos], item = item, arr[pos]
      writes += 1
    end
  end
  writes
end

arr = [5, 4, 3, 2, 1]
cycle_sort(arr)
puts arr.inspect
