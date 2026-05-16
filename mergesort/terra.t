local terra merge(arr : &int, left : int, mid : int, right : int)
  var i = left
  var j = mid + 1
  var k = 0
  var result = arrayof(int, right - left + 1)
  
  while i <= mid and j <= right do
    if arr[i] <= arr[j] then
      result[k] = arr[i]
      i = i + 1
    else
      result[k] = arr[j]
      j = j + 1
    end
    k = k + 1
  end
  
  while i <= mid do
    result[k] = arr[i]
    i = i + 1
    k = k + 1
  end
  
  while j <= right do
    result[k] = arr[j]
    j = j + 1
    k = k + 1
  end
  
  for k = 0, right - left + 1 do
    arr[left + k] = result[k]
  end
end

local terra mergesort(arr : &int, left : int, right : int)
  if left < right then
    var mid = (left + right) / 2
    mergesort(arr, left, mid)
    mergesort(arr, mid + 1, right)
    merge(arr, left, mid, right)
  end
end

terra test()
  var arr : int[6] = arrayof(int, 5, 2, 8, 1, 9, 3)
  mergesort(arr, 0, 5)
  return arr[0]
end
