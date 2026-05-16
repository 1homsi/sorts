PROGRAM SHELLSORT;
VAR
  arr : ARRAY[1..6] OF INTEGER;
  n, gap, i, j, temp : INTEGER;
BEGIN
  arr[1] := 5; arr[2] := 2; arr[3] := 8;
  arr[4] := 1; arr[5] := 9; arr[6] := 3;
  n := 6;
  gap := 1;
  WHILE gap <= n DO
    gap := gap * 3 + 1;
  WHILE gap > 0 DO BEGIN
    gap := gap DIV 3;
    FOR i := gap+1 TO n DO BEGIN
      temp := arr[i];
      j := i;
      WHILE j > gap AND arr[j-gap] > temp DO BEGIN
        arr[j] := arr[j-gap];
        j := j - gap;
      END;
      arr[j] := temp;
    END;
  END;
  WRITE(arr);
END.
