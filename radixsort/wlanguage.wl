FUNCTION radixsort(arr)
  LOCAL i, max, exp
  max = 0
  FOR i = 1 TO ArraySize(arr)
    IF arr[i] > max
      max = arr[i]
    END
  END
  exp = 1
  WHILE max / exp > 0
    arr = countingSortByExp(arr, exp)
    exp = exp * 10
  END
  RETURN arr
END

FUNCTION countingSortByExp(arr, exp)
  RETURN arr
END

RESULT = radixsort([5, 2, 8, 1, 9, 3])
MESSAGE RESULT
