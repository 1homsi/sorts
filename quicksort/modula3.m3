MODULE Quicksort EXPORTS Main;
IMPORT IO, Fmt;

VAR arr := ARRAY [0..6] OF INTEGER {3, 6, 8, 10, 1, 2, 1};

PROCEDURE Partition(low, high: INTEGER): INTEGER =
  VAR pivot, tmp, i, j: INTEGER;
BEGIN
  pivot := arr[high];
  i := low;
  FOR j := low TO high - 1 DO
    IF arr[j] <= pivot THEN
      tmp := arr[i]; arr[i] := arr[j]; arr[j] := tmp;
      INC(i)
    END
  END;
  tmp := arr[i]; arr[i] := arr[high]; arr[high] := tmp;
  RETURN i
END Partition;

PROCEDURE Quicksort(low, high: INTEGER) =
  VAR p: INTEGER;
BEGIN
  IF low < high THEN
    p := Partition(low, high);
    Quicksort(low, p - 1);
    Quicksort(p + 1, high)
  END
END Quicksort;

BEGIN
  Quicksort(0, 6);
  FOR i := 0 TO 6 DO IO.Put(Fmt.Int(arr[i]) & " ") END;
  IO.Put("\n")
END Quicksort.
