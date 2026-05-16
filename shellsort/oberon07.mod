MODULE Shellsort;
IMPORT Out;
VAR
  arr : ARRAY 6 OF INTEGER;
  n, gap, i, j, temp : INTEGER;
BEGIN
  arr[0] := 5; arr[1] := 2; arr[2] := 8;
  arr[3] := 1; arr[4] := 9; arr[5] := 3;
  n := 6;
  gap := 1;
  WHILE gap <= n DO
    gap := gap * 3 + 1;
  END;
  WHILE gap > 0 DO
    gap := gap DIV 3;
    FOR i := gap TO n - 1 DO
      temp := arr[i];
      j := i;
      WHILE j >= gap AND arr[j - gap] > temp DO
        arr[j] := arr[j - gap];
        j := j - gap;
      END;
      arr[j] := temp;
    END;
  END;
  FOR i := 0 TO n - 1 DO
    Out.Int(arr[i], 1); Out.Ln;
  END;
END Shellsort.
