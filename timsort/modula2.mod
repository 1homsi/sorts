MODULE TimSort;

FROM InOut IMPORT WriteInt, WriteLn;

CONST MinRun = 32;

VAR arr: ARRAY [0..8] OF INTEGER;
    n, i, size, leftIdx, mid, right: INTEGER;
    lp, rp: ARRAY [0..255] OF INTEGER;
    ln, rn: INTEGER;

PROCEDURE InsertionSort(left, right: INTEGER);
VAR i, j, key: INTEGER;
BEGIN
    i := left + 1;
    WHILE i <= right DO
        key := arr[i];
        j := i - 1;
        WHILE (j >= left) AND (arr[j] > key) DO
            arr[j + 1] := arr[j];
            DEC(j);
        END;
        arr[j + 1] := key;
        INC(i);
    END;
END InsertionSort;

PROCEDURE Merge(left, mid, right: INTEGER);
VAR i, j, k: INTEGER;
BEGIN
    ln := mid - left + 1;
    rn := right - mid;
    FOR i := 0 TO ln - 1 DO lp[i] := arr[left + i] END;
    FOR i := 0 TO rn - 1 DO rp[i] := arr[mid + 1 + i] END;
    i := 0; j := 0; k := left;
    WHILE (i < ln) AND (j < rn) DO
        IF lp[i] <= rp[j] THEN arr[k] := lp[i]; INC(i);
        ELSE arr[k] := rp[j]; INC(j); END;
        INC(k);
    END;
    WHILE i < ln DO arr[k] := lp[i]; INC(i); INC(k) END;
    WHILE j < rn DO arr[k] := rp[j]; INC(j); INC(k) END;
END Merge;

BEGIN
    arr[0]:=5; arr[1]:=2; arr[2]:=8; arr[3]:=1; arr[4]:=9;
    arr[5]:=3; arr[6]:=7; arr[7]:=4; arr[8]:=6;
    n := 9;
    i := 0;
    WHILE i < n DO
        right := i + MinRun - 1;
        IF right >= n THEN right := n - 1 END;
        InsertionSort(i, right);
        INC(i, MinRun);
    END;
    size := MinRun;
    WHILE size < n DO
        leftIdx := 0;
        WHILE leftIdx < n DO
            mid := leftIdx + size - 1;
            IF mid >= n THEN mid := n - 1 END;
            right := leftIdx + 2 * size - 1;
            IF right >= n THEN right := n - 1 END;
            IF mid < right THEN Merge(leftIdx, mid, right) END;
            INC(leftIdx, 2 * size);
        END;
        size := size * 2;
    END;
    FOR i := 0 TO n - 1 DO
        WriteInt(arr[i], 4);
    END;
    WriteLn;
END TimSort.
