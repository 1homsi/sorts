PROCEDURE BubbleSort(arr)
VAR i, j, n, temp
n = ArrayLength(arr)
FOR i = 1 TO n
  FOR j = 1 TO (n - i)
    IF arr[j] > arr[j+1] THEN
      temp = arr[j]
      arr[j] = arr[j+1]
      arr[j+1] = temp
    END
  END
END
RETURN arr
END

print(BubbleSort([5, 2, 8, 1, 9, 3]))