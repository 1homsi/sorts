MODULE InsertionSort;
  IMPORT Out;
  VAR
    arr: ARRAY 6 OF INTEGER;
    n, i, j, key: INTEGER;
  
  PROCEDURE Sort*(VAR a: ARRAY OF INTEGER; len: INTEGER);
    VAR i, j, key: INTEGER;
  BEGIN
    FOR i := 1 TO len - 1 DO
      key := a[i];
      j := i - 1;
      WHILE (j >= 0) & (a[j] > key) DO
        a[j+1] := a[j];
        DEC(j)
      END;
      a[j+1] := key
    END
  END Sort;

BEGIN
  arr[0] := 5; arr[1] := 2; arr[2] := 8; arr[3] := 1; arr[4] := 9; arr[5] := 3;
  Sort(arr, 6);
  FOR i := 0 TO 5 DO Out.Int(arr[i], 0) END
END InsertionSort.