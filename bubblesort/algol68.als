BEGIN
    [7]INT arr := (64, 34, 25, 12, 22, 11, 90);
    INT n := 7, tmp;
    BOOL swapped;
    DO
        swapped := FALSE;
        FOR i TO n - 1 DO
            IF arr[i] > arr[i+1] THEN
                tmp := arr[i];
                arr[i] := arr[i+1];
                arr[i+1] := tmp;
                swapped := TRUE
            FI
        OD;
        n -:= 1;
        IF NOT swapped THEN EXIT FI
    OD;
    FOR i TO 7 DO
        print((arr[i], " "))
    OD;
    print(newline)
END
