MODULE BogSort;
  IMPORT Out;

  VAR arr: ARRAY 3 OF INTEGER;

  PROCEDURE Bogosort;
    VAR i, j, n, tmp, sorted: INTEGER;
  BEGIN
    n := 3;
    sorted := 0;
    WHILE sorted = 0 DO
      sorted := 1;
      FOR i := 0 TO n - 2 DO
        IF arr[i] > arr[i + 1] THEN
          sorted := 0;
        END;
      END;
      IF sorted = 0 THEN
        FOR i := 0 TO n - 1 DO
          j := i;
          tmp := arr[i];
          arr[i] := arr[j];
          arr[j] := tmp;
        END;
      END;
    END;
  END Bogosort;

BEGIN
  arr[0] := 3;
  arr[1] := 1;
  arr[2] := 2;
  Bogosort;
  Out.Int(arr[0], 1); Out.Ln;
END BogSort.
