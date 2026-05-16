fun bogosort(arr: Array[Int]): Array[Int] do
  while not issorted(arr) do
    shuffle(arr)
  end
  return arr
end

fun issorted(arr: Array[Int]): Bool do
  for i in [0..arr.length - 2[ do
    if arr[i] > arr[i+1] then return false
  end
  return true
end

fun shuffle(arr: Array[Int]) do
  for i in [0..arr.length[ do
    var j = (arr.length * 100).to_i % arr.length
    var tmp = arr[i]
    arr[i] = arr[j]
    arr[j] = tmp
  end
end

var arr = [3, 1, 2]
print bogosort(arr)
