BEGIN
    [8] INT arr := (3, 7, 4, 8, 6, 2, 1, 5);

    PROC compare and swap = (REF [] INT a, INT i, j, BOOL dir) VOID:
    BEGIN
        IF dir = (a[i] > a[j]) THEN
            INT tmp := a[i];
            a[i] := a[j];
            a[j] := tmp
        FI
    END;

    PROC bitonic merge = (REF [] INT a, INT lo, cnt, BOOL dir) VOID:
    BEGIN
        IF cnt > 1 THEN
            INT k := cnt OVER 2;
            FOR i FROM lo TO lo + k - 1 DO
                compare and swap(a, i, i + k, dir)
            OD;
            bitonic merge(a, lo, k, dir);
            bitonic merge(a, lo + k, k, dir)
        FI
    END;

    PROC bitonic sort = (REF [] INT a, INT lo, cnt, BOOL dir) VOID:
    BEGIN
        IF cnt > 1 THEN
            INT k := cnt OVER 2;
            bitonic sort(a, lo, k, TRUE);
            bitonic sort(a, lo + k, k, FALSE);
            bitonic merge(a, lo, cnt, dir)
        FI
    END;

    bitonic sort(arr, 1, 8, TRUE);
    FOR i FROM 1 TO 8 DO
        print((arr[i], " "))
    OD;
    print(newline)
END
