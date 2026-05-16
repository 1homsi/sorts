MODULE CocktailSort;

FROM InOut IMPORT WriteInt, WriteLn;

TYPE IntArray = ARRAY [0..99] OF INTEGER;

PROCEDURE Sort(VAR arr : IntArray; n : CARDINAL);
VAR
    swapped : BOOLEAN;
    start, ending, i : CARDINAL;
    tmp : INTEGER;
BEGIN
    swapped := TRUE;
    start := 0;
    ending := n - 1;
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
            IF i = 0 THEN EXIT END;
            DEC(i)
        END;
        INC(start)
    END
END Sort;

END CocktailSort.
