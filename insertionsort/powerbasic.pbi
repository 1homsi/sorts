SUB InsertionSort(arr() AS INTEGER, n AS INTEGER)
    DIM i AS INTEGER, j AS INTEGER, key AS INTEGER
    FOR i = 1 TO n - 1
        key = arr(i)
        j = i - 1
        WHILE j >= 0 AND arr(j) > key
            arr(j + 1) = arr(j)
            j = j - 1
        WEND
        arr(j + 1) = key
    NEXT i
END SUB
