MODULE CombSort;
  IMPORT Out;
  VAR arr: ARRAY 6 OF INTEGER;
      gap, i, temp: INTEGER;
      swapped: BOOLEAN;
BEGIN
  arr[0] := 5; arr[1] := 2; arr[2] := 8; arr[3] := 1; arr[4] := 9; arr[5] := 3;
  gap := 6;
  swapped := TRUE;
  WHILE gap > 1 OR swapped DO
    gap := gap * 10 DIV 13;
    IF gap < 1 THEN gap := 1 END;
    swapped := FALSE;
    FOR i := 0 TO 6 - gap - 1 DO
      IF arr[i] > arr[i + gap] THEN
        temp := arr[i];
        arr[i] := arr[i + gap];
        arr[i + gap] := temp;
        swapped := TRUE;
      END;
    END;
  END;
  FOR i := 0 TO 5 DO
    Out.Int(arr[i], 0); Out.Ln;
  END;
END CombSort.
