MODULE RadixSort;
  IMPORT Out;

  PROCEDURE Sort(VAR a: ARRAY OF INTEGER; n: INTEGER);
    VAR i, max, exp: INTEGER;
  BEGIN
    max := a[0];
    FOR i := 1 TO n - 1 DO
      IF a[i] > max THEN max := a[i] END
    END;
    exp := 1;
    WHILE max / exp > 0 DO
      exp := exp * 10
    END
  END Sort;

  VAR arr: ARRAY 6 OF INTEGER;
  VAR i: INTEGER;

BEGIN
  arr[0] := 5; arr[1] := 2; arr[2] := 8;
  arr[3] := 1; arr[4] := 9; arr[5] := 3;
  Sort(arr, 6);
  FOR i := 0 TO 5 DO
    Out.Int(arr[i], 1); Out.Char(' ')
  END
END RadixSort.
