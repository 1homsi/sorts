MODULE InsertionSort;

PROCEDURE Sort(VAR arr: ARRAY OF INTEGER; n: INTEGER);
VAR
  i, j, key: INTEGER;
BEGIN
  FOR i := 1 TO n - 1 DO
    key := arr[i];
    j := i - 1;
    WHILE (j >= 0) AND (arr[j] > key) DO
      arr[j + 1] := arr[j];
      DEC(j);
    END;
    arr[j + 1] := key;
  END;
END Sort;

END InsertionSort.
