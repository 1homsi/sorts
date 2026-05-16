PROCEDURE Quicksort
  PARAMETERS arr

  IF Length(arr) <= 1
    RETURN arr
  END

  pivot = arr[1]
  less = ()
  greater = ()

  FOR i = 2 TO Length(arr)
    IF arr[i] <= pivot
      Add(less, arr[i])
    ELSE
      Add(greater, arr[i])
    END
  END

  RETURN Concatenate(Quicksort(less), pivot, Quicksort(greater))
END

result is Quicksort({5, 2, 8, 1, 9, 3})