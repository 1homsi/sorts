MODULE StoogeSort EXPORTS Main;

IMPORT IO, Fmt;

VAR
    arr := ARRAY [0..7] OF INTEGER {3, 1, 4, 1, 5, 9, 2, 6};

PROCEDURE StoogeSort(first, last: INTEGER) =
VAR tmp, t, n: INTEGER;
BEGIN
    IF arr[first] > arr[last] THEN
        tmp := arr[first];
        arr[first] := arr[last];
        arr[last] := tmp;
    END;
    n := last - first + 1;
    IF n > 2 THEN
        t := n * 2 DIV 3;
        StoogeSort(first, first + t - 1);
        StoogeSort(last - t + 1, last);
        StoogeSort(first, first + t - 1);
    END;
END StoogeSort;

BEGIN
    StoogeSort(0, 7);
    FOR i := 0 TO 7 DO
        IO.Put(Fmt.Int(arr[i]) & " ");
    END;
    IO.Put("\n");
END StoogeSort.
