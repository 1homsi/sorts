SUB GnomeSort(arr() AS INTEGER, n AS INTEGER)
    DIM i AS INTEGER = 0
    DIM tmp AS INTEGER
    WHILE i < n
        IF i = 0 OR arr(i) >= arr(i - 1) THEN
            i = i + 1
        ELSE
            tmp = arr(i)
            arr(i) = arr(i - 1)
            arr(i - 1) = tmp
            i = i - 1
        END IF
    WEND
END SUB
