PROCEDURE cocktailsort(arr)
    n := ArrayLength(arr)
    i := 0
    WHILE i < n
        swapped := False
        FOR k := 0 TO n - i - 2
            IF arr[k] > arr[k + 1] THEN
                temp := arr[k]
                arr[k] := arr[k + 1]
                arr[k + 1] := temp
                swapped := True
            END
        END
        IF NOT swapped THEN EXIT END
        i := i + 1
        swapped := False
        FOR k := n - i - 2 DOWN TO 0
            IF arr[k] > arr[k + 1] THEN
                temp := arr[k]
                arr[k] := arr[k + 1]
                arr[k + 1] := temp
                swapped := True
            END
        END
        IF NOT swapped THEN EXIT END
        i := i + 1
    END
END

arr := {5, 2, 8, 1, 9, 3}
cocktailsort(arr)
Trace(arr)
