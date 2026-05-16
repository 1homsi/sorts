MODULE SelectionSort EXPORTS Main;
IMPORT IO;
VAR arr := ARRAY [0..4] OF INTEGER {5, 3, 1, 4, 2};
    n := 5;
    i, j, minIdx, tmp: INTEGER;
BEGIN
  FOR i := 0 TO n - 2 DO
    minIdx := i;
    FOR j := i + 1 TO n - 1 DO
      IF arr[j] < arr[minIdx] THEN minIdx := j END
    END;
    tmp := arr[i]; arr[i] := arr[minIdx]; arr[minIdx] := tmp
  END
END SelectionSort.
