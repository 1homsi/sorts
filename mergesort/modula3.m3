MODULE MergeSort EXPORTS Main;

IMPORT IO, Fmt;

CONST N = 7;

VAR arr := ARRAY [0..N-1] OF INTEGER {38,27,43,3,9,82,10};
VAR tmp: ARRAY [0..N-1] OF INTEGER;

PROCEDURE Merge(lo, mid, hi: INTEGER) =
VAR i, j, k: INTEGER;
BEGIN
    i := lo; j := mid + 1; k := lo;
    WHILE (i <= mid) AND (j <= hi) DO
        IF arr[i] <= arr[j] THEN tmp[k] := arr[i]; INC(i);
        ELSE tmp[k] := arr[j]; INC(j); END;
        INC(k);
    END;
    WHILE i <= mid DO tmp[k] := arr[i]; INC(i); INC(k); END;
    WHILE j <= hi DO tmp[k] := arr[j]; INC(j); INC(k); END;
    FOR i := lo TO hi DO arr[i] := tmp[i]; END;
END Merge;

PROCEDURE MSort(lo, hi: INTEGER) =
VAR mid: INTEGER;
BEGIN
    IF lo < hi THEN
        mid := (lo + hi) DIV 2;
        MSort(lo, mid);
        MSort(mid + 1, hi);
        Merge(lo, mid, hi);
    END;
END MSort;

BEGIN
    MSort(0, N-1);
    FOR i := 0 TO N-1 DO IO.Put(Fmt.Int(arr[i]) & " "); END;
    IO.Put("\n");
END MergeSort.
