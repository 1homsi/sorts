GLOBAL arr() AS INTEGER

SUB Flip(k AS INTEGER)
    DIM left AS INTEGER, right AS INTEGER, tmp AS INTEGER
    left = 0: right = k
    WHILE left < right
        tmp = arr(left): arr(left) = arr(right): arr(right) = tmp
        left = left + 1: right = right - 1
    WEND
END SUB

FUNCTION FindMaxIdx(size AS INTEGER) AS INTEGER
    DIM maxIdx AS INTEGER, i AS INTEGER
    maxIdx = 0
    FOR i = 1 TO size - 1
        IF arr(i) > arr(maxIdx) THEN maxIdx = i
    NEXT i
    FUNCTION = maxIdx
END FUNCTION

FUNCTION PBMAIN() AS LONG
    DIM n AS INTEGER, size AS INTEGER, maxIdx AS INTEGER, i AS INTEGER
    n = 7
    REDIM arr(0 TO n-1)
    arr(0)=3: arr(1)=6: arr(2)=2: arr(3)=7
    arr(4)=4: arr(5)=1: arr(6)=5
    size = n
    WHILE size > 1
        maxIdx = FindMaxIdx(size)
        IF maxIdx <> size - 1 THEN
            IF maxIdx <> 0 THEN Flip(maxIdx)
            Flip(size - 1)
        END IF
        size = size - 1
    WEND
    FOR i = 0 TO n - 1: PRINT arr(i); " ";: NEXT i
    PRINT
    FUNCTION = 0
END FUNCTION
