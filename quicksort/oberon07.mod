MODULE Quicksort;
IMPORT Out;

PROCEDURE Sort(VAR a: ARRAY OF INTEGER; n: INTEGER);
VAR i, j, pivot, temp: INTEGER;
BEGIN
  IF n <= 1 THEN RETURN END;
  pivot := a[0];
  i := 1;
  j := n;
  WHILE i < j DO
    WHILE a[i] < pivot DO i := i + 1 END;
    WHILE a[j] > pivot DO j := j - 1 END;
    IF i < j THEN
      temp := a[i]; a[i] := a[j]; a[j] := temp;
      i := i + 1; j := j - 1;
    END;
  END;
END Sort;

BEGIN
  VAR arr: ARRAY 6 OF INTEGER;
  VAR i: INTEGER;
  arr := [5, 2, 8, 1, 9, 3];
  Sort(arr, 6);
  FOR i := 0 TO 5 DO Out.Int(arr[i], 4) END;
END Quicksort.