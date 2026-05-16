MODULE CycleSort;
IMPORT Out;

VAR arr: ARRAY 6 OF INTEGER;

PROCEDURE cyclesort;
VAR n, pos, item, cycles, i, temp: INTEGER;
BEGIN
  n := 6;
  pos := 0;
  WHILE pos < n DO
    item := arr[pos];
    cycles := 0;
    FOR i := 0 TO n-1 DO
      IF (i # pos) & (arr[i] < item) THEN
        INC(cycles)
      END
    END;
    IF cycles # 0 THEN
      WHILE arr[pos] = item DO
        INC(pos)
      END;
      temp := arr[pos];
      arr[pos] := item;
      item := temp;
      WHILE cycles > 0 DO
        cycles := 0;
        FOR i := 0 TO n-1 DO
          IF (i # pos) & (arr[i] < item) THEN
            INC(cycles)
          END
        END;
        WHILE arr[pos] = item DO
          INC(pos)
        END;
        temp := arr[pos];
        arr[pos] := item;
        item := temp;
        DEC(cycles)
      END
    END;
    INC(pos)
  END
END cyclesort;

BEGIN
  arr[0] := 5; arr[1] := 2; arr[2] := 8; arr[3] := 1; arr[4] := 9; arr[5] := 3;
  cyclesort;
  FOR i := 0 TO 5 DO
    Out.Int(arr[i], 0); Out.Char(" ")
  END;
  Out.Ln
END CycleSort.
