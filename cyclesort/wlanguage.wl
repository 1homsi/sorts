PROCEDURE cyclesort(arr)
  n = Length(arr)
  pos = 0
  WHILE pos < n
    item = arr[pos]
    cycles = 0
    FOR i = 1 TO n
      IF i <> pos AND arr[i] < item THEN
        cycles = cycles + 1
      END
    END
    IF cycles <> 0 THEN
      WHILE arr[pos] = item
        pos = pos + 1
      END
      temp = arr[pos]
      arr[pos] = item
      item = temp
      WHILE cycles > 0
        cycles = 0
        FOR i = 1 TO n
          IF i <> pos AND arr[i] < item THEN
            cycles = cycles + 1
          END
        END
        WHILE arr[pos] = item
          pos = pos + 1
        END
        temp = arr[pos]
        arr[pos] = item
        item = temp
        cycles = cycles - 1
      END
    END
    pos = pos + 1
  END
RETURN arr
END

PROCEDURE Main()
  result = cyclesort([5, 2, 8, 1, 9, 3])
  Trace(result)
END
