BEGIN
    INT n = 8;
    [n]INT arr := (3, 1, 4, 1, 5, 9, 2, 6);

    PROC stooge sort = (REF[]INT a, INT first, last) VOID:
    BEGIN
        IF a[first] > a[last] THEN
            INT tmp := a[first];
            a[first] := a[last];
            a[last] := tmp
        FI;
        IF last - first + 1 > 2 THEN
            INT t := (last - first + 1) * 2 OVER 3;
            stooge sort(a, first, first + t - 1);
            stooge sort(a, last - t + 1, last);
            stooge sort(a, first, first + t - 1)
        FI
    END;

    stooge sort(arr, 1, n);
    FOR i FROM 1 TO n DO print((arr[i], " ")) OD;
    print(newline)
END
