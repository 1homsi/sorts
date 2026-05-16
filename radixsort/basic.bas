DIM arr(7) AS INTEGER
DIM output(7) AS INTEGER
DIM count(9) AS INTEGER

arr(0) = 170 : arr(1) = 45 : arr(2) = 75 : arr(3) = 90
arr(4) = 802 : arr(5) = 24 : arr(6) = 2  : arr(7) = 66

maxVal = arr(0)
FOR i = 1 TO 7
    IF arr(i) > maxVal THEN maxVal = arr(i)
NEXT i

exp = 1
WHILE maxVal \ exp > 0
    FOR i = 0 TO 9 : count(i) = 0 : NEXT i
    FOR i = 0 TO 7
        idx = (arr(i) \ exp) MOD 10
        count(idx) = count(idx) + 1
    NEXT i
    FOR i = 1 TO 9
        count(i) = count(i) + count(i-1)
    NEXT i
    FOR i = 7 TO 0 STEP -1
        idx = (arr(i) \ exp) MOD 10
        count(idx) = count(idx) - 1
        output(count(idx)) = arr(i)
    NEXT i
    FOR i = 0 TO 7 : arr(i) = output(i) : NEXT i
    exp = exp * 10
WEND

FOR i = 0 TO 7
    PRINT arr(i);
NEXT i
PRINT
END
