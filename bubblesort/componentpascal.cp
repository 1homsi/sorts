MODULE BubbleSortCP;

IMPORT Out;

VAR
    arr: ARRAY 8 OF INTEGER;
    n, i, tmp: INTEGER;
    swapped: BOOLEAN;

PROCEDURE Sort*;
BEGIN
    n := 7;
    REPEAT
        swapped := FALSE;
        FOR i := 1 TO n-1 DO
            IF arr[i] > arr[i+1] THEN
                tmp := arr[i];
                arr[i] := arr[i+1];
                arr[i+1] := tmp;
                swapped := TRUE
            END
        END;
        DEC(n)
    UNTIL ~swapped
END Sort;

BEGIN
    arr[1] := 64; arr[2] := 34; arr[3] := 25; arr[4] := 12;
    arr[5] := 22; arr[6] := 11; arr[7] := 90;
    Sort;
    FOR i := 1 TO 7 DO Out.Int(arr[i], 5) END;
    Out.Ln
END BubbleSortCP.
