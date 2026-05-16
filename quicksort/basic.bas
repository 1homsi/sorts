DIM arr(6) AS INTEGER
arr(0) = 3: arr(1) = 6: arr(2) = 8: arr(3) = 10
arr(4) = 1: arr(5) = 2: arr(6) = 1

SUB quicksort(arr() AS INTEGER, low AS INTEGER, high AS INTEGER)
    IF low >= high THEN EXIT SUB
    DIM pivot AS INTEGER = arr(high)
    DIM i AS INTEGER = low
    DIM j AS INTEGER
    DIM tmp AS INTEGER
    FOR j = low TO high - 1
        IF arr(j) <= pivot THEN
            tmp = arr(i): arr(i) = arr(j): arr(j) = tmp
            i = i + 1
        END IF
    NEXT j
    tmp = arr(i): arr(i) = arr(high): arr(high) = tmp
    quicksort arr(), low, i - 1
    quicksort arr(), i + 1, high
END SUB

quicksort arr(), 0, 6
DIM i AS INTEGER
FOR i = 0 TO 6
    PRINT arr(i);
NEXT i
PRINT
