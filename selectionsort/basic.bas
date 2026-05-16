DIM arr(10) AS INTEGER
DIM n AS INTEGER
n = 5
arr(1) = 5: arr(2) = 3: arr(3) = 1: arr(4) = 4: arr(5) = 2
FOR i = 1 TO n - 1
    minIdx = i
    FOR j = i + 1 TO n
        IF arr(j) < arr(minIdx) THEN minIdx = j
    NEXT j
    tmp = arr(i): arr(i) = arr(minIdx): arr(minIdx) = tmp
NEXT i
END
