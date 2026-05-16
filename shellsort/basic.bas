SUB Shellsort(arr() AS INTEGER)
    DIM n AS INTEGER, gap AS INTEGER, i AS INTEGER, j AS INTEGER, temp AS INTEGER
    n = UBOUND(arr)
    gap = n / 2
    WHILE gap > 0
        FOR i = gap TO n
            temp = arr(i)
            j = i
            WHILE j >= gap AND arr(j - gap) > temp
                arr(j) = arr(j - gap)
                j = j - gap
            WEND
            arr(j) = temp
        NEXT i
        gap = gap / 2
    WEND
END SUB
