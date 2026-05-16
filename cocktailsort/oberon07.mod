MODULE CocktailSort;
  IMPORT Out;
  
  PROCEDURE Sort*(VAR arr: ARRAY OF INTEGER);
    VAR n, i, k, temp: INTEGER;
        swapped: BOOLEAN;
  BEGIN
    n := LEN(arr);
    i := 0;
    WHILE i < n DO
      swapped := FALSE;
      FOR k := 0 TO n - i - 2 DO
        IF arr[k] > arr[k + 1] THEN
          temp := arr[k];
          arr[k] := arr[k + 1];
          arr[k + 1] := temp;
          swapped := TRUE;
        END;
      END;
      IF NOT swapped THEN EXIT; END;
      INC(i);
    END;
  END Sort;
  
  VAR arr: ARRAY 6 OF INTEGER;
  
BEGIN
  arr[0] := 5; arr[1] := 2; arr[2] := 8; arr[3] := 1; arr[4] := 9; arr[5] := 3;
  Sort(arr);
  FOR i := 0 TO 5 DO Out.Int(arr[i], 4); END;
END CocktailSort.
