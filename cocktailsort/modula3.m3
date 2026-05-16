MODULE CocktailSort;

IMPORT IO;

TYPE IntArr = REF ARRAY OF INTEGER;

PROCEDURE Sort(arr: IntArr) =
VAR
    swapped: BOOLEAN;
    start, ending, i: INTEGER;
    tmp: INTEGER;
BEGIN
    swapped := TRUE;
    start := 0;
    ending := LAST(arr^);
    WHILE swapped DO
        swapped := FALSE;
        FOR i := start TO ending - 1 DO
            IF arr[i] > arr[i + 1] THEN
                tmp := arr[i];
                arr[i] := arr[i + 1];
                arr[i + 1] := tmp;
                swapped := TRUE
            END
        END;
        IF NOT swapped THEN RETURN END;
        swapped := FALSE;
        DEC(ending);
        i := ending - 1;
        WHILE i >= start DO
            IF arr[i] > arr[i + 1] THEN
                tmp := arr[i];
                arr[i] := arr[i + 1];
                arr[i + 1] := tmp;
                swapped := TRUE
            END;
            DEC(i)
        END;
        INC(start)
    END
END Sort;

BEGIN
END CocktailSort.
