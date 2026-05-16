PROCEDURE Shellsort(LOCAL arr)
  LOCAL n = ArrayCount(arr)
  LOCAL gap = 1
  LOOP
    IF gap <= n THEN
      gap = gap * 3 + 1
    ELSE
      BREAK
    END
  END
  LOOP
    IF gap > 0 THEN
      gap = gap / 3
      FOR i = gap TO n
        LOCAL temp = arr[i]
        LOCAL j = i
        LOOP
          IF AND(j >= gap, arr[j - gap] > temp) THEN
            arr[j] = arr[j - gap]
            j = j - gap
          ELSE
            BREAK
          END
        END
        arr[j] = temp
      END
    ELSE
      BREAK
    END
  END
  RESULT arr
END
