FUNCTION timsort(arr, minSize)
  RETURN mergesort(arr, minSize)
END

FUNCTION mergesort(arr, minSize)
  LOCAL mid, left, right
  
  IF length(arr) <= 1 THEN
    RETURN arr
  END
  
  IF length(arr) <= minSize THEN
    RETURN insertionsort(arr)
  END
  
  mid = length(arr) / 2
  left = extract(arr, 1, mid)
  right = extract(arr, mid + 1, length(arr))
  
  RETURN merge(mergesort(left, minSize), mergesort(right, minSize))
END

FUNCTION insertionsort(arr)
  LOCAL i, j, key, result
  
  result = copy(arr)
  FOR i = 2 TO length(result)
    key = result[i]
    j = i - 1
    WHILE j >= 1 AND result[j] > key
      result[j + 1] = result[j]
      j = j - 1
    END
    result[j + 1] = key
  END
  
  RETURN result
END

FUNCTION merge(left, right)
  LOCAL result, i, j
  
  result = {}
  i = 1
  j = 1
  
  WHILE i <= length(left) AND j <= length(right)
    IF left[i] <= right[j] THEN
      add(result, left[i])
      i = i + 1
    ELSE
      add(result, right[j])
      j = j + 1
    END
  END
  
  WHILE i <= length(left)
    add(result, left[i])
    i = i + 1
  END
  WHILE j <= length(right)
    add(result, right[j])
    j = j + 1
  END
  
  RETURN result
END
