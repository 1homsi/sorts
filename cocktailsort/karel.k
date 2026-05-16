PROGRAM COCKTAILSORT;
VAR
    arr: ARRAY [1..6] OF INTEGER;
    n, i, k, temp: INTEGER;
    swapped: BOOLEAN;

BEGIN
    arr[1] := 5;
    arr[2] := 2;
    arr[3] := 8;
    arr[4] := 1;
    arr[5] := 9;
    arr[6] := 3;
    n := 6;
    i := 0;
    
    WHILE i < n DO
    BEGIN
        swapped := false;
        FOR k := 1 TO n - i - 1 DO
        BEGIN
            IF arr[k] > arr[k + 1] THEN
            BEGIN
                temp := arr[k];
                arr[k] := arr[k + 1];
                arr[k + 1] := temp;
                swapped := true;
            END;
        END;
        IF NOT swapped THEN GOTO done;
        i := i + 1;
    END;
    done:
END.
