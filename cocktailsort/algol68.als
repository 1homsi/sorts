BEGIN
    PROC cocktail sort = (REF [] INT arr) VOID:
    BEGIN
        INT n = UPB arr;
        BOOL swapped := TRUE;
        INT start := 1;
        INT ending := n;
        INT tmp;
        WHILE swapped DO
            swapped := FALSE;
            FOR i FROM start TO ending - 1 DO
                IF arr[i] > arr[i + 1] THEN
                    tmp := arr[i];
                    arr[i] := arr[i + 1];
                    arr[i + 1] := tmp;
                    swapped := TRUE
                FI
            OD;
            IF NOT swapped THEN GO TO done FI;
            swapped := FALSE;
            ending -:= 1;
            FOR i FROM ending - 1 BY -1 TO start DO
                IF arr[i] > arr[i + 1] THEN
                    tmp := arr[i];
                    arr[i] := arr[i + 1];
                    arr[i + 1] := tmp;
                    swapped := TRUE
                FI
            OD;
            start +:= 1
        OD;
        done: SKIP
    END;
    []INT data = (5, 3, 1, 4, 2);
    REF []INT arr = LOC [1:5] INT := data;
    cocktail sort(arr)
END
