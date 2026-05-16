MODULE MergeSort;

FROM InOut IMPORT WriteInt, WriteLn;

CONST N = 7;

VAR
    arr: ARRAY [0..N-1] OF INTEGER;
    tmp: ARRAY [0..N-1] OF INTEGER;

PROCEDURE Merge(lo, mid, hi: INTEGER);
VAR i, j, k: INTEGER;
BEGIN
    i := lo; j := mid + 1; k := lo;
    WHILE (i <= mid) AND (j <= hi) DO
        IF arr[i] <= arr[j] THEN
            tmp[k] := arr[i]; INC(i);
        ELSE
            tmp[k] := arr[j]; INC(j);
        END;
        INC(k);
    END;
    WHILE i <= mid DO tmp[k] := arr[i]; INC(i); INC(k); END;
    WHILE j <= hi DO tmp[k] := arr[j]; INC(j); INC(k); END;
    FOR i := lo TO hi DO arr[i] := tmp[i]; END;
END Merge;

PROCEDURE MergeSort(lo, hi: INTEGER);
VAR mid: INTEGER;
BEGIN
    IF lo < hi THEN
        mid := (lo + hi) DIV 2;
        MergeSort(lo, mid);
        MergeSort(mid + 1, hi);
        Merge(lo, mid, hi);
    END;
END MergeSort;

VAR i: INTEGER;
BEGIN
    arr[0]:=38; arr[1]:=27; arr[2]:=43; arr[3]:=3;
    arr[4]:=9; arr[5]:=82; arr[6]:=10;
    MergeSort(0, N-1);
    FOR i := 0 TO N-1 DO WriteInt(arr[i], 5); END;
    WriteLn;
END MergeSort.
