PROCEDURE CountingSort(arr)
  LOCAL max, i, j, count, output

  max = 0
  FOR i = 1 TO ArrayCount(arr)
    IF arr[i] > max THEN
      max = arr[i]
    END
  END

  REDIMENSION count(max + 1)
  FOR i = 1 TO max + 1
    count[i] = 0
  END

  FOR i = 1 TO ArrayCount(arr)
    count[arr[i]] = count[arr[i]] + 1
  END

  OUTPUT = New Array
  j = 1
  FOR i = 1 TO max + 1
    FOR EACH c OF count
      IF c > 0 THEN
        OUTPUT[j] = i - 1
        j = j + 1
      END
    END
  END

  RETURN OUTPUT
END

test = [5, 2, 8, 1, 9, 3]
result = CountingSort(test)
Trace(result)
