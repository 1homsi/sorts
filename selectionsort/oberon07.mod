MODULE SelectionSort;
  IMPORT Out;
  VAR arr: ARRAY 6 OF INTEGER;
      n, i, j, minIdx, tmp: INTEGER;
BEGIN
  arr[0] := 5; arr[1] := 2; arr[2] := 8;
  arr[3] := 1; arr[4] := 9; arr[5] := 3;
  n := 6;
  
  FOR i := 0 TO n - 2 DO
    minIdx := i;
    FOR j := i + 1 TO n - 1 DO
      IF arr[j] < arr[minIdx] THEN minIdx := j END;
    END;
    tmp := arr[i];
    arr[i] := arr[minIdx];
    arr[minIdx] := tmp;
  END;
  
  FOR i := 0 TO n - 1 DO Out.Int(arr[i], 0) END;
END SelectionSort.