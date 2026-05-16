fun timsort(arr: Array[Int], min_size: Int): Array[Int] do
  return mergesort(arr, min_size)
end

fun mergesort(arr: Array[Int], min_size: Int): Array[Int] do
  if arr.length <= 1 then
    return arr
  end
  if arr.length <= min_size then
    return insertionsort(arr)
  end
  
  var mid = arr.length / 2
  var left = arr.subarray(0, mid)
  var right = arr.subarray(mid, arr.length - mid)
  
  return merge(mergesort(left, min_size), mergesort(right, min_size))
end

fun insertionsort(arr: Array[Int]): Array[Int] do
  var result = arr.to_a
  for i in [1..result.length - 1] do
    var key = result[i]
    var j = i - 1
    while j >= 0 and result[j] > key do
      result[j + 1] = result[j]
      j = j - 1
    end
    result[j + 1] = key
  end
  return result
end

fun merge(left: Array[Int], right: Array[Int]): Array[Int] do
  var result = new Array[Int]
  var i = 0
  var j = 0
  
  while i < left.length and j < right.length do
    if left[i] <= right[j] then
      result.add(left[i])
      i = i + 1
    else
      result.add(right[j])
      j = j + 1
    end
  end
  
  while i < left.length do
    result.add(left[i])
    i = i + 1
  end
  while j < right.length do
    result.add(right[j])
    j = j + 1
  end
  
  return result
end

var arr = [5, 2, 8, 1, 9, 3]
print timsort(arr, 32)
