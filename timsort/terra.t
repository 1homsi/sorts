local timsort = terralib.memoize(function(T)
  return terra(arr : &T, len : int, minSize : int) : &T
    if len <= 1 then
      return arr
    end
    if len <= minSize then
      return insertionsort(arr, len)
    end
    
    var mid = len / 2
    var left = [T](mid)
    var right = [T](len - mid)
    
    for i = 0, mid do
      left[i] = arr[i]
    end
    for i = 0, len - mid do
      right[i] = arr[mid + i]
    end
    
    return merge(mergesort(left, mid, minSize), mergesort(right, len - mid, minSize))
  end
end)

local insertionsort = function(T)
  return terra(arr : &T, len : int) : &T
    for i = 1, len do
      var key = arr[i]
      var j = i - 1
      while j >= 0 and arr[j] > key do
        arr[j + 1] = arr[j]
        j = j - 1
      end
      arr[j + 1] = key
    end
    return arr
  end
end

local merge = function(T)
  return terra(left : &T, lenL : int, right : &T, lenR : int) : &T
    var result = [T](lenL + lenR)
    var i = 0
    var j = 0
    
    while i < lenL and j < lenR do
      if left[i] <= right[j] then
        result[i + j] = left[i]
        i = i + 1
      else
        result[i + j] = right[j]
        j = j + 1
      end
    end
    return result
  end
end
