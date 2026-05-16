MODULE CycleSort;

FROM InOut IMPORT WriteInt, WriteLn, WriteString;

VAR
    arr: ARRAY [0..4] OF INTEGER;
    n, cycleStart, item, pos, i, tmp, writes: INTEGER;

BEGIN
    arr[0] := 5; arr[1] := 4; arr[2] := 3; arr[3] := 2; arr[4] := 1;
    n := 5;
    writes := 0;
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
    FOR i := 0 TO n - 1 DO
        WriteInt(arr[i], 4)
    END;
    WriteLn
END CycleSort.
