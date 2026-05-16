MODULE TimSort EXPORTS Main;

IMPORT IO, Fmt;

CONST MinRun = 32;

TYPE IntArr = REF ARRAY OF INTEGER;

PROCEDURE InsertionSort(arr: IntArr; left, right: INTEGER) =
VAR key, j: INTEGER;
BEGIN
    FOR i := left + 1 TO right DO
        key := arr[i];
        j := i - 1;
        WHILE j >= left AND arr[j] > key DO
            arr[j + 1] := arr[j];
            DEC(j);
        END;
        arr[j + 1] := key;
    END;
END InsertionSort;

PROCEDURE Merge(arr: IntArr; left, mid, right: INTEGER) =
VAR ln, rn, i, j, k: INTEGER;
    lp, rp: IntArr;
BEGIN
    ln := mid - left + 1;
    rn := right - mid;
    lp := NEW(IntArr, ln);
    rp := NEW(IntArr, rn);
    FOR i := 0 TO ln - 1 DO lp[i] := arr[left + i] END;
    FOR i := 0 TO rn - 1 DO rp[i] := arr[mid + 1 + i] END;
    i := 0; j := 0; k := left;
    WHILE i < ln AND j < rn DO
        IF lp[i] <= rp[j] THEN arr[k] := lp[i]; INC(i);
        ELSE arr[k] := rp[j]; INC(j); END;
        INC(k);
    END;
    WHILE i < ln DO arr[k] := lp[i]; INC(i); INC(k) END;
    WHILE j < rn DO arr[k] := rp[j]; INC(j); INC(k) END;
END Merge;

PROCEDURE Timsort(arr: IntArr) =
VAR n, i, size, left, mid, right: INTEGER;
BEGIN
    n := NUMBER(arr^);
    i := 0;
    WHILE i < n DO
        InsertionSort(arr, i, MIN(i + MinRun - 1, n - 1));
        INC(i, MinRun);
    END;
    size := MinRun;
    WHILE size < n DO
        left := 0;
        WHILE left < n DO
            mid := MIN(left + size - 1, n - 1);
            right := MIN(left + 2 * size - 1, n - 1);
            IF mid < right THEN Merge(arr, left, mid, right) END;
            INC(left, 2 * size);
        END;
        size := size * 2;
    END;
END Timsort;

VAR arr: IntArr;
BEGIN
    arr := NEW(IntArr, 9);
    arr^ := ARRAY OF INTEGER{5, 2, 8, 1, 9, 3, 7, 4, 6};
    Timsort(arr);
    FOR i := 0 TO 8 DO
        IO.Put(Fmt.Int(arr[i]) & " ");
    END;
    IO.Put("\n");
END TimSort.
