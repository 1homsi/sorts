MODULE Heapsort EXPORTS Main;

IMPORT IO, Fmt;

VAR arr := ARRAY [0..5] OF INTEGER {12, 11, 13, 5, 6, 7};

PROCEDURE Heapify(n, i: INTEGER) =
VAR largest, left, right, tmp: INTEGER;
BEGIN
  largest := i; left := 2*i+1; right := 2*i+2;
  IF left < n AND arr[left] > arr[largest] THEN largest := left END;
  IF right < n AND arr[right] > arr[largest] THEN largest := right END;
  IF largest # i THEN
    tmp := arr[i]; arr[i] := arr[largest]; arr[largest] := tmp;
    Heapify(n, largest)
  END
END Heapify;

PROCEDURE Heapsort() =
VAR n := NUMBER(arr); tmp: INTEGER;
BEGIN
  FOR i := n DIV 2 - 1 TO 0 BY -1 DO Heapify(n, i) END;
  FOR i := n - 1 TO 1 BY -1 DO
    tmp := arr[0]; arr[0] := arr[i]; arr[i] := tmp;
    Heapify(i, 0)
  END
END Heapsort;

BEGIN
  Heapsort();
  FOR i := 0 TO 5 DO IO.Put(Fmt.Int(arr[i]) & " ") END;
  IO.Put("\n")
END Heapsort.
