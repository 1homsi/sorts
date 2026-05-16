PROC selection sort = (REF [] INT arr) VOID:
BEGIN
    INT n = UPB arr;
    FOR i FROM 1 TO n - 1 DO
        INT min idx := i;
        FOR j FROM i + 1 TO n DO
            IF arr[j] < arr[min idx] THEN min idx := j FI
        OD;
        INT tmp = arr[i];
        arr[i] := arr[min idx];
        arr[min idx] := tmp
    OD
END;
