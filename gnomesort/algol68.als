PROC gnome sort = (REF[]INT arr) VOID:
BEGIN
    INT n = UPB arr;
    INT i := 1;
    WHILE i <= n DO
        IF i = 1 OR arr[i] >= arr[i-1] THEN
            i +:= 1
        ELSE
            INT tmp = arr[i];
            arr[i] := arr[i-1];
            arr[i-1] := tmp;
            i -:= 1
        FI
    OD
END;
