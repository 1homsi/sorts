DIM arr(5) AS INTEGER
arr(0) = 12: arr(1) = 11: arr(2) = 13: arr(3) = 5: arr(4) = 6: arr(5) = 7
n = 6

FOR i = INT(n / 2) - 1 TO 0 STEP -1
    GOSUB HEAPIFY_START
NEXT i

FOR i = n - 1 TO 1 STEP -1
    tmp = arr(0): arr(0) = arr(i): arr(i) = tmp
    ni = i
    ii = 0
    GOSUB HEAPIFY_LOOP
NEXT i

FOR i = 0 TO n - 1
    PRINT arr(i);
NEXT i
PRINT
END

HEAPIFY_START:
    ni = n: ii = i
HEAPIFY_LOOP:
    largest = ii
    left = 2 * ii + 1
    right = 2 * ii + 2
    IF left < ni AND arr(left) > arr(largest) THEN largest = left
    IF right < ni AND arr(right) > arr(largest) THEN largest = right
    IF largest <> ii THEN
        tmp = arr(ii): arr(ii) = arr(largest): arr(largest) = tmp
        ii = largest
        GOTO HEAPIFY_LOOP
    END IF
RETURN
