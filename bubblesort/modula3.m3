MODULE BubbleSort EXPORTS Main;

IMPORT IO;

VAR
    arr := ARRAY [1..7] OF INTEGER {64, 34, 25, 12, 22, 11, 90};

PROCEDURE Sort(VAR a: ARRAY OF INTEGER) =
  VAR n := NUMBER(a); tmp: INTEGER; swapped: BOOLEAN;
  BEGIN
    REPEAT
      swapped := FALSE;
      FOR i := FIRST(a) TO FIRST(a) + n - 2 DO
        IF a[i] > a[i+1] THEN
          tmp := a[i]; a[i] := a[i+1]; a[i+1] := tmp;
          swapped := TRUE;
        END;
      END;
      DEC(n);
    UNTIL NOT swapped;
  END Sort;

BEGIN
  Sort(arr);
  FOR i := 1 TO 7 DO
    IO.PutInt(arr[i]); IO.Put(" ");
  END;
  IO.PutChar('\n');
END BubbleSort.
