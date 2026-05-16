DIM arr(6) AS INTEGER
DATA 3, 6, 2, 7, 4, 1, 5
FOR i = 0 TO 6: READ arr(i): NEXT i

SUB flip(k AS INTEGER)
    DIM left AS INTEGER, right AS INTEGER, tmp AS INTEGER
    left = 0: right = k
    WHILE left < right
        tmp = arr(left): arr(left) = arr(right): arr(right) = tmp
        left = left + 1: right = right - 1
    WEND
END SUB

DIM size AS INTEGER, maxIdx AS INTEGER
FOR size = 7 TO 2 STEP -1
    maxIdx = 0
    FOR i = 1 TO size - 1
        IF arr(i) > arr(maxIdx) THEN maxIdx = i
    NEXT i
    IF maxIdx <> size - 1 THEN
        IF maxIdx <> 0 THEN CALL flip(maxIdx)
        CALL flip(size - 1)
    END IF
NEXT size

FOR i = 0 TO 6: PRINT arr(i); " ";: NEXT i
PRINT
