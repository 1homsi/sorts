DIM arr(9) AS DOUBLE
DIM buckets(9, 9) AS DOUBLE
DIM counts(9) AS INTEGER
DIM n AS INTEGER
DIM minV AS DOUBLE, maxV AS DOUBLE
DIM idx AS INTEGER, i AS INTEGER, j AS INTEGER, b AS INTEGER, pos AS INTEGER
DIM key AS DOUBLE

n = 10
arr(0) = 0.78 : arr(1) = 0.17 : arr(2) = 0.39 : arr(3) = 0.26 : arr(4) = 0.72
arr(5) = 0.94 : arr(6) = 0.21 : arr(7) = 0.12 : arr(8) = 0.23 : arr(9) = 0.68

minV = arr(0) : maxV = arr(0)
FOR i = 0 TO n - 1
    IF arr(i) < minV THEN minV = arr(i)
    IF arr(i) > maxV THEN maxV = arr(i)
NEXT i

FOR i = 0 TO n - 1
    idx = INT((arr(i) - minV) / (maxV - minV + 1) * n)
    IF idx >= n THEN idx = n - 1
    buckets(idx, counts(idx)) = arr(i)
    counts(idx) = counts(idx) + 1
NEXT i

pos = 0
FOR b = 0 TO n - 1
    FOR i = 1 TO counts(b) - 1
        key = buckets(b, i)
        j = i - 1
        WHILE j >= 0 AND buckets(b, j) > key
            buckets(b, j + 1) = buckets(b, j)
            j = j - 1
        WEND
        buckets(b, j + 1) = key
    NEXT i
    FOR i = 0 TO counts(b) - 1
        arr(pos) = buckets(b, i)
        pos = pos + 1
    NEXT i
NEXT b

FOR i = 0 TO n - 1
    PRINT arr(i)
NEXT i
