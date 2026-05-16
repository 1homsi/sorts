PROCEDURE CombSort(ARRAY arr)
  LOCAL INT gap, i, temp
  LOCAL BOOLEAN swapped

  gap = ArraySize(arr)
  swapped = True

  WHILE gap > 1 OR swapped
    gap = Int(gap * 10 / 13)
    IF gap < 1 THEN
      gap = 1
    END

    swapped = False
    FOR i = 1 TO ArraySize(arr) - gap
      IF arr[i] > arr[i + gap] THEN
        temp = arr[i]
        arr[i] = arr[i + gap]
        arr[i + gap] = temp
        swapped = True
      END
    END
  END

  RETURN arr
END

PROCEDURE Main()
  LOCAL ARRAY arr[5]
  arr[0] = 5
  arr[1] = 2
  arr[2] = 8
  arr[3] = 1
  arr[4] = 9
  arr[5] = 3
  CombSort(arr)
END
