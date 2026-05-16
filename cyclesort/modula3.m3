MODULE CycleSort EXPORTS Main;

IMPORT IO;

VAR
    arr := ARRAY OF INTEGER {5, 4, 3, 2, 1};
    n := 5;
    writes := 0;
    cycleStart, item, pos, i, tmp: INTEGER;

BEGIN
    cycleStart := 0;
    WHILE cycleStart < n - 1 DO
        item := arr[cycleStart];
        pos := cycleStart;
        i := cycleStart + 1;
        WHILE i < n DO
            IF arr[i] < item THEN INC(pos) END;
            INC(i)
        END;
        IF pos # cycleStart THEN
            WHILE item = arr[pos] DO INC(pos) END;
            tmp := arr[pos]; arr[pos] := item; item := tmp;
            INC(writes);
            WHILE pos # cycleStart DO
                pos := cycleStart;
                i := cycleStart + 1;
                WHILE i < n DO
                    IF arr[i] < item THEN INC(pos) END;
                    INC(i)
                END;
                WHILE item = arr[pos] DO INC(pos) END;
                tmp := arr[pos]; arr[pos] := item; item := tmp;
                INC(writes)
            END
        END;
        INC(cycleStart)
    END;
    FOR idx := 0 TO n - 1 DO
        IO.PutInt(arr[idx]); IO.Put(" ")
    END;
    IO.PutLn()
END CycleSort.
