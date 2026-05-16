MODULE HeapSort;
IMPORT Out;

VAR arr: ARRAY 6 OF INTEGER;

PROCEDURE SiftDown(VAR a: ARRAY OF INTEGER; idx, n: INTEGER);
VAR largest, left, right, temp: INTEGER;
BEGIN
  largest := idx;
  left := 2 * idx + 1;
  right := 2 * idx + 2;
  IF (left < n) & (a[left] > a[largest]) THEN
    largest := left
  END;
  IF (right < n) & (a[right] > a[largest]) THEN
    largest := right
  END;
  IF largest # idx THEN
    temp := a[idx];
    a[idx] := a[largest];
    a[largest] := temp;
    SiftDown(a, largest, n)
  END
END SiftDown;

PROCEDURE HeapSort(VAR a: ARRAY OF INTEGER; n: INTEGER);
VAR i, temp: INTEGER;
BEGIN
  FOR i := n DIV 2 - 1 TO 0 BY -1 DO
    SiftDown(a, i, n)
  END;
  FOR i := n - 1 TO 1 BY -1 DO
    temp := a[0];
    a[0] := a[i];
    a[i] := temp;
    SiftDown(a, 0, i)
  END
END HeapSort;

BEGIN
  arr[0] := 5; arr[1] := 2; arr[2] := 8; arr[3] := 1; arr[4] := 9; arr[5] := 3;
  HeapSort(arr, 6);
  FOR i := 0 TO 5 DO
    Out.Int(arr[i], 0); Out.Char(' ')
  END;
  Out.Ln
END HeapSort.
