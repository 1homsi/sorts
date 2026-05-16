fun merge(arr: Array[Int], left: Int, mid: Int, right: Int) do
  var i = left
  var j = mid + 1
  var k = 0
  var result = new Array[Int]
  
  while i <= mid and j <= right do
    if arr[i] <= arr[j] then
      result.add(arr[i])
      i += 1
    else
      result.add(arr[j])
      j += 1
    end
    k += 1
  end
  
  while i <= mid do
    result.add(arr[i])
    i += 1
  end
  
  while j <= right do
    result.add(arr[j])
    j += 1
  end
  
  for k in [0..result.length-1] do
    arr[left + k] = result[k]
  end
end

fun mergesort(arr: Array[Int], left: Int, right: Int) do
  if left < right then
    var mid = (left + right) / 2
    mergesort(arr, left, mid)
    mergesort(arr, mid + 1, right)
    merge(arr, left, mid, right)
  end
end

var arr = [5, 2, 8, 1, 9, 3]
mergesort(arr, 0, 5)
print(arr)
