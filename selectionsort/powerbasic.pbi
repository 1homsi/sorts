FUNCTION SelectionSort(arr() AS INTEGER) AS INTEGER
    DIM n AS INTEGER = UBOUND(arr)
    DIM i AS INTEGER, j AS INTEGER, minIdx AS INTEGER, tmp AS INTEGER
    FOR i = LBOUND(arr) TO n - 1
        minIdx = i
        FOR j = i + 1 TO n
            IF arr(j) < arr(minIdx) THEN minIdx = j
        NEXT j
        tmp = arr(i): arr(i) = arr(minIdx): arr(minIdx) = tmp
    NEXT i
END FUNCTION
