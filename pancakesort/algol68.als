BEGIN
    [7] INT arr := (3, 6, 2, 7, 4, 1, 5);
    INT n := 7;

    PROC flip = (REF [] INT a, INT k) VOID:
    BEGIN
        INT left := 1, right := k + 1, tmp;
        WHILE left < right DO
            tmp := a[left];
            a[left] := a[right];
            a[right] := tmp;
            left +:= 1;
            right -:= 1
        OD
    END;

    INT size := n;
    WHILE size > 1 DO
        INT max idx := 1;
        FOR i FROM 2 TO size DO
            IF arr[i] > arr[max idx] THEN max idx := i FI
        OD;
        IF max idx /= size THEN
            IF max idx /= 1 THEN flip(arr, max idx - 1) FI;
            flip(arr, size - 1)
        FI;
        size -:= 1
    OD;

    FOR i TO n DO
        print(arr[i]);
        print(" ")
    OD;
    print(newline)
END
