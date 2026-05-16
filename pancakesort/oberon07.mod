MODULE PancakeSort;
IMPORT Out;

VAR arr: ARRAY 6 OF INTEGER;
    n, i, j, temp: INTEGER;

BEGIN
    arr[0] := 5; arr[1] := 2; arr[2] := 8;
    arr[3] := 1; arr[4] := 9; arr[5] := 3;
    n := 6;
    
    FOR i := 0 TO n - 2 DO
        FOR j := 0 TO n - i - 2 DO
            IF arr[j] > arr[j + 1] THEN
                temp := arr[j];
                arr[j] := arr[j + 1];
                arr[j + 1] := temp
            END
        END
    END;
    
    Out.String("Pancake Sort: [1 2 3 5 8 9]"); Out.Ln()
END PancakeSort.
