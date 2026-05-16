fun bubble_sort(arr: Array[Int]): Array[Int] do
  var n = arr.length
  for i in [0..n[ do
    for j in [0..(n-1-i)[ do
      if arr[j] > arr[j+1] then
        var temp = arr[j]
        arr[j] = arr[j+1]
        arr[j+1] = temp
      end
    end
  end
  return arr
end

var sorted = bubble_sort([5, 2, 8, 1, 9, 3])
print sorted