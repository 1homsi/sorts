MODULE BitonicSort;
  IMPORT Out;

  PROCEDURE BitonicSort(VAR arr: ARRAY OF INTEGER; lo, cnt, dir: INTEGER);
    VAR k: INTEGER;
  BEGIN
    IF cnt > 1 THEN
      k := cnt DIV 2;
      BitonicSort(arr, lo, k, 1);
      BitonicSort(arr, lo + k, k, 0);
      BitonicMerge(arr, lo, cnt, dir);
    END;
  END BitonicSort;

  PROCEDURE BitonicMerge(VAR arr: ARRAY OF INTEGER; lo, cnt, dir: INTEGER);
    VAR k, i, tmp: INTEGER;
  BEGIN
    IF cnt > 1 THEN
      k := cnt DIV 2;
      FOR i := lo TO lo + cnt - k - 1 DO
        IF (arr[i] > arr[i + k]) = (dir = 1) THEN
          tmp := arr[i];
          arr[i] := arr[i + k];
          arr[i + k] := tmp;
        END;
      END;
      BitonicMerge(arr, lo, k, dir);
      BitonicMerge(arr, lo + k, k, dir);
    END;
  END BitonicMerge;

  VAR arr: ARRAY 8 OF INTEGER;
BEGIN
  arr[0] := 5; arr[1] := 2; arr[2] := 8; arr[3] := 1;
  arr[4] := 9; arr[5] := 3; arr[6] := 7; arr[7] := 4;
  BitonicSort(arr, 0, 8, 1);
  Out.String("Sorted");
END BitonicSort.
