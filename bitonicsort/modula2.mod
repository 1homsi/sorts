MODULE BitonicSort;

FROM InOut IMPORT WriteInt, WriteLn;

VAR arr : ARRAY [0..7] OF INTEGER;

PROCEDURE CompareAndSwap(i, j : INTEGER; direction : BOOLEAN);
VAR tmp : INTEGER;
BEGIN
    IF direction = (arr[i] > arr[j]) THEN
        tmp := arr[i]; arr[i] := arr[j]; arr[j] := tmp
    END
END CompareAndSwap;

PROCEDURE BitonicMerge(lo, cnt : INTEGER; direction : BOOLEAN);
VAR k, i : INTEGER;
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

PROCEDURE BitonicSort(lo, cnt : INTEGER; direction : BOOLEAN);
VAR k : INTEGER;
BEGIN
    IF cnt > 1 THEN
        k := cnt DIV 2;
        BitonicSort(lo, k, TRUE);
        BitonicSort(lo + k, k, FALSE);
        BitonicMerge(lo, cnt, direction)
    END
END BitonicSort;

VAR i : INTEGER;
BEGIN
    arr[0] := 3; arr[1] := 7; arr[2] := 4; arr[3] := 8;
    arr[4] := 6; arr[5] := 2; arr[6] := 1; arr[7] := 5;
    BitonicSort(0, 8, TRUE);
    FOR i := 0 TO 7 DO
        WriteInt(arr[i], 4)
    END;
    WriteLn
END BitonicSort.
