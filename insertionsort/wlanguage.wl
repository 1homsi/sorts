PROCEDURE insertionSort(arr: array)
VAR
  n, i, j, key: int
BEGIN
  n := ArrayLength(arr);
  FOR i := 2 TO n DO
    key := arr[i];
    j := i - 1;
    WHILE j > 0 AND arr[j] > key DO
      arr[j+1] := arr[j];
      j := j - 1;
    END;
    arr[j+1] := key;
  END;
  RESULT arr;
END;

ARRAY arr = [5, 2, 8, 1, 9, 3];
MESSAGE insertionSort(arr);