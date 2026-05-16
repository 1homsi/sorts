MODULE GnomeSort;

TYPE IntArray = ARRAY [0..99] OF INTEGER;

PROCEDURE Sort(VAR arr: IntArray; n: CARDINAL);
VAR
    i: INTEGER;
    tmp: INTEGER;
BEGIN
    i := 0;
    WHILE i < VAL(INTEGER, n) DO
        IF (i = 0) OR (arr[i] >= arr[i - 1]) THEN
            INC(i)
        ELSE
            tmp := arr[i];
            arr[i] := arr[i - 1];
            arr[i - 1] := tmp;
            DEC(i)
        END
    END
END Sort;

END GnomeSort.
