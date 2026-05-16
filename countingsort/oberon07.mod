MODULE CountingSort;
  IMPORT Out;

  PROCEDURE Sort(VAR arr: ARRAY OF INTEGER);
    VAR max, i, j, count: ARRAY OF INTEGER;
    VAR m, idx: INTEGER;
  BEGIN
    m := 0;
    FOR i := 0 TO LEN(arr) - 1 DO
      IF arr[i] > m THEN
        m := arr[i];
      END;
    END;

    NEW(count, m + 1);
    FOR i := 0 TO m DO
      count[i] := 0;
    END;

    FOR i := 0 TO LEN(arr) - 1 DO
      count[arr[i]] := count[arr[i]] + 1;
    END;

    idx := 0;
    FOR i := 0 TO m DO
      FOR j := 0 TO count[i] - 1 DO
        arr[idx] := i;
        idx := idx + 1;
      END;
    END;
  END Sort;

  VAR arr: ARRAY 6 OF INTEGER;
  VAR i: INTEGER;
BEGIN
  arr[0] := 5; arr[1] := 2; arr[2] := 8;
  arr[3] := 1; arr[4] := 9; arr[5] := 3;
  Sort(arr);
  FOR i := 0 TO 5 DO
    Out.Int(arr[i], 4);
  END;
  Out.Ln;
END CountingSort.
