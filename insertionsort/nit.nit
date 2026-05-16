fun insertion_sort(arr: Array[Int]) do
  var n = arr.length
  for i in [1..n[ do
    var key = arr[i]
    var j = i - 1
    while j >= 0 and arr[j] > key do
      arr[j+1] = arr[j]
      j -= 1
    end
    arr[j+1] = key
  end
  print arr
end

insertion_sort([5, 2, 8, 1, 9, 3])