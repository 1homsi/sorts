MODULE ShellSort EXPORTS Main;
IMPORT IO, Fmt;

VAR
  arr := ARRAY [0..6] OF INTEGER {64, 34, 25, 12, 22, 11, 90};

PROCEDURE Sort(VAR a: ARRAY OF INTEGER) =
  VAR n, gap, i, j, temp: INTEGER;
  BEGIN
    n := NUMBER(a);
    gap := n DIV 2;
    WHILE gap > 0 DO
      FOR idx := gap TO n - 1 DO
        i := idx;
        temp := a[i];
        j := i;
        WHILE (j >= gap) AND (a[j - gap] > temp) DO
          a[j] := a[j - gap];
          j := j - gap;
        END;
        a[j] := temp;
      END;
      gap := gap DIV 2;
    END;
  END Sort;

BEGIN
  Sort(arr);
  FOR i := 0 TO 6 DO
    IO.Put(Fmt.Int(arr[i]) & " ");
  END;
  IO.Put("\n");
END ShellSort.
