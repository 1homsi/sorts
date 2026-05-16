BEGIN
    [7]INT arr := (64, 34, 25, 12, 22, 11, 90);
    INT n := 7;
    INT gap := n OVER 2;
    WHILE gap > 0 DO
        FOR i FROM gap + 1 TO n DO
            INT temp := arr[i];
            INT j := i;
            WHILE j > gap AND arr[j - gap] > temp DO
                arr[j] := arr[j - gap];
                j -:= gap
            OD;
            arr[j] := temp
        OD;
        gap OVERAB 2
    OD;
    FOR i TO n DO print((arr[i], " ")) OD;
    print(newline)
END
