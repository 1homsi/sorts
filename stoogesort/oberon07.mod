MODULE StoogeSort;

PROCEDURE Sort(VAR a : ARRAY OF INTEGER; i, j : INTEGER);
VAR
  temp, t : INTEGER;
BEGIN
  IF a[j] < a[i] THEN
    temp := a[j];
    a[j] := a[i];
    a[i] := temp;
  END;
  IF j - i > 1 THEN
    t := (j - i + 1) DIV 3;
    Sort(a, i, j - t);
    Sort(a, i + t, j);
    Sort(a, i, j - t);
  END;
END Sort;

VAR
  arr : ARRAY 6 OF INTEGER;
  i : INTEGER;

BEGIN
  arr[0] := 5; arr[1] := 2; arr[2] := 8;
  arr[3] := 1; arr[4] := 9; arr[5] := 3;
  Sort(arr, 0, 5);
END StoogeSort.
