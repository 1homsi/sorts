PROGRAM BitonicSort(input, output);

PROCEDURE BitonicSort(VAR arr: ARRAY[0..7] OF INTEGER;
                      lo, cnt, dir: INTEGER);
VAR
  k: INTEGER;
BEGIN
  IF cnt > 1 THEN BEGIN
    k := cnt DIV 2;
    BitonicSort(arr, lo, k, 1);
    BitonicSort(arr, lo + k, k, 0);
    BitonicMerge(arr, lo, cnt, dir);
  END;
END;

PROCEDURE BitonicMerge(VAR arr: ARRAY[0..7] OF INTEGER;
                       lo, cnt, dir: INTEGER);
VAR
  k, i, tmp: INTEGER;
BEGIN
  IF cnt > 1 THEN BEGIN
    k := cnt DIV 2;
    FOR i := lo TO lo + cnt - k - 1 DO BEGIN
      IF (arr[i] > arr[i + k]) = (dir = 1) THEN BEGIN
        tmp := arr[i];
        arr[i] := arr[i + k];
        arr[i + k] := tmp;
      END;
    END;
    BitonicMerge(arr, lo, k, dir);
    BitonicMerge(arr, lo + k, k, dir);
  END;
END;

VAR
  arr: ARRAY[0..7] OF INTEGER;

BEGIN
  arr[0] := 5; arr[1] := 2; arr[2] := 8; arr[3] := 1;
  arr[4] := 9; arr[5] := 3; arr[6] := 7; arr[7] := 4;
  BitonicSort(arr, 0, 8, 1);
  WRITE(arr);
END.
