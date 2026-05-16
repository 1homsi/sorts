MODULE BitonicSort EXPORTS Main;

IMPORT IO;

VAR arr : ARRAY [0..7] OF INTEGER;

PROCEDURE CompareAndSwap(i, j: INTEGER; direction: BOOLEAN) =
  VAR tmp: INTEGER;
  BEGIN
    IF direction = (arr[i] > arr[j]) THEN
      tmp := arr[i]; arr[i] := arr[j]; arr[j] := tmp
    END
  END CompareAndSwap;

PROCEDURE BitonicMerge(lo, cnt: INTEGER; direction: BOOLEAN) =
  VAR k, i: INTEGER;
  BEGIN
    IF cnt > 1 THEN
      k := cnt DIV 2;
      FOR i := lo TO lo + k - 1 DO
        CompareAndSwap(i, i + k, direction)
      END;
      BitonicMerge(lo, k, direction);
      BitonicMerge(lo + k, k, direction)
    END
  END BitonicMerge;

PROCEDURE BitonicSort(lo, cnt: INTEGER; direction: BOOLEAN) =
  VAR k: INTEGER;
  BEGIN
    IF cnt > 1 THEN
      k := cnt DIV 2;
      BitonicSort(lo, k, TRUE);
      BitonicSort(lo + k, k, FALSE);
      BitonicMerge(lo, cnt, direction)
    END
  END BitonicSort;

BEGIN
  arr := ARRAY OF INTEGER {3, 7, 4, 8, 6, 2, 1, 5};
  BitonicSort(0, 8, TRUE);
  FOR i := 0 TO 7 DO
    IO.PutInt(arr[i]); IO.Put(" ")
  END;
  IO.Put("\n")
END BitonicSort.
