MODULE ComponentShellSort;
IMPORT Out;

PROCEDURE Sort*(VAR arr: ARRAY OF INTEGER; n: INTEGER);
VAR gap, i, j, temp: INTEGER;
BEGIN
  gap := n DIV 2;
  WHILE gap > 0 DO
    FOR i := gap TO n - 1 DO
      temp := arr[i];
      j := i;
      WHILE (j >= gap) & (arr[j-gap] > temp) DO
        arr[j] := arr[j-gap];
        j := j - gap
      END;
      arr[j] := temp
    END;
    gap := gap DIV 2
  END
END Sort;

VAR data: ARRAY 7 OF INTEGER;
    i: INTEGER;
BEGIN
  data[0] := 64; data[1] := 34; data[2] := 25; data[3] := 12;
  data[4] := 22; data[5] := 11; data[6] := 90;
  Sort(data, 7);
  FOR i := 0 TO 6 DO Out.Int(data[i], 4) END;
  Out.Ln
END ComponentShellSort.
