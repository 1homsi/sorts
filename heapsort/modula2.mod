MODULE Heapsort;

FROM InOut IMPORT WriteInt, WriteLn, WriteString;

VAR
  arr: ARRAY [0..5] OF INTEGER;
  n, i, tmp: INTEGER;

PROCEDURE Heapify(n, i: INTEGER);
VAR
  largest, left, right, t: INTEGER;
BEGIN
  largest := i;
  left := 2 * i + 1;
  right := 2 * i + 2;
  IF (left < n) AND (arr[left] > arr[largest]) THEN largest := left END;
  IF (right < n) AND (arr[right] > arr[largest]) THEN largest := right END;
  IF largest # i THEN
    t := arr[i]; arr[i] := arr[largest]; arr[largest] := t;
    Heapify(n, largest)
  END
END Heapify;

BEGIN
  arr[0] := 12; arr[1] := 11; arr[2] := 13;
  arr[3] := 5; arr[4] := 6; arr[5] := 7;
  n := 6;
  FOR i := n DIV 2 - 1 TO 0 BY -1 DO Heapify(n, i) END;
  FOR i := n - 1 TO 1 BY -1 DO
    tmp := arr[0]; arr[0] := arr[i]; arr[i] := tmp;
    Heapify(i, 0)
  END;
  FOR i := 0 TO n - 1 DO WriteInt(arr[i], 5) END;
  WriteLn
END Heapsort.
