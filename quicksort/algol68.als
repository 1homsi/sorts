BEGIN
    PROC partition = (REF[]INT arr, INT low, high) INT:
    BEGIN
        INT pivot = arr[high];
        INT i := low;
        FOR j FROM low TO high - 1 DO
            IF arr[j] <= pivot THEN
                INT tmp = arr[i]; arr[i] := arr[j]; arr[j] := tmp;
                i +:= 1
            FI
        OD;
        INT tmp = arr[i]; arr[i] := arr[high]; arr[high] := tmp;
        i
    END;

    PROC quicksort = (REF[]INT arr, INT low, high) VOID:
    IF low < high THEN
        INT p = partition(arr, low, high);
        quicksort(arr, low, p - 1);
        quicksort(arr, p + 1, high)
    FI;

    [7]INT arr = (3, 6, 8, 10, 1, 2, 1);
    quicksort(arr, 1, 7);
    FOR x IN arr DO print(x) OD;
    print(newline)
END
