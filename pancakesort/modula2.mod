MODULE PancakeSort;

FROM InOut IMPORT WriteInt, WriteLn;

VAR
    arr: ARRAY [0..6] OF INTEGER;
    n, size, i, maxIdx, left, right, tmp: INTEGER;

PROCEDURE Flip(k: INTEGER);
BEGIN
    left := 0; right := k;
    WHILE left < right DO
        tmp := arr[left];
        arr[left] := arr[right];
        arr[right] := tmp;
        INC(left); DEC(right)
    END
END Flip;

BEGIN
    arr[0] := 3; arr[1] := 6; arr[2] := 2; arr[3] := 7;
    arr[4] := 4; arr[5] := 1; arr[6] := 5;
    n := 7;

    size := n;
    WHILE size > 1 DO
        maxIdx := 0;
        FOR i := 1 TO size - 1 DO
            IF arr[i] > arr[maxIdx] THEN maxIdx := i END
        END;
        IF maxIdx # size - 1 THEN
            IF maxIdx # 0 THEN Flip(maxIdx) END;
            Flip(size - 1)
        END;
        DEC(size)
    END;

    FOR i := 0 TO n - 1 DO
        WriteInt(arr[i], 4)
    END;
    WriteLn
END PancakeSort.
