PROGRAM CycleSort;
VAR
  arr : ARRAY[1..6] OF INTEGER;
  n, pos, item, cycles, i, temp : INTEGER;

PROCESS sorter;
BEGIN
  n := 6;
  pos := 1;
  WHILE pos <= n DO
  BEGIN
    item := arr[pos];
    cycles := 0;
    FOR i := 1 TO n DO
      IF i <> pos AND arr[i] < item THEN
        cycles := cycles + 1;
    IF cycles <> 0 THEN
    BEGIN
      WHILE arr[pos] = item DO
        pos := pos + 1;
      temp := arr[pos];
      arr[pos] := item;
      item := temp;
      WHILE cycles > 0 DO
      BEGIN
        cycles := 0;
        FOR i := 1 TO n DO
          IF i <> pos AND arr[i] < item THEN
            cycles := cycles + 1;
        WHILE arr[pos] = item DO
          pos := pos + 1;
        temp := arr[pos];
        arr[pos] := item;
        item := temp;
        cycles := cycles - 1
      END
    END;
    pos := pos + 1
  END
END;

BEGIN
  arr[1] := 5; arr[2] := 2; arr[3] := 8; arr[4] := 1; arr[5] := 9; arr[6] := 3;
  COBEGIN
    sorter
  COEND
END.
