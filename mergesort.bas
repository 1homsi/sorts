DIM SHARED arr(1 TO 6) AS INTEGER
DATA 5, 2, 8, 1, 9, 3
FOR i = 1 TO 6 : READ arr(i) : NEXT i

SUB Merge (l AS INTEGER, m AS INTEGER, r AS INTEGER)
    DIM tmp(l TO r) AS INTEGER
    DIM i AS INTEGER, j AS INTEGER, k AS INTEGER
    i = l : j = m + 1 : k = l
    DO WHILE i <= m AND j <= r
        IF arr(i) <= arr(j) THEN
            tmp(k) = arr(i) : i = i + 1
        ELSE
            tmp(k) = arr(j) : j = j + 1
        END IF
        k = k + 1
    LOOP
    DO WHILE i <= m : tmp(k) = arr(i) : i = i + 1 : k = k + 1 : LOOP
    DO WHILE j <= r : tmp(k) = arr(j) : j = j + 1 : k = k + 1 : LOOP
    FOR k = l TO r : arr(k) = tmp(k) : NEXT k
END SUB

SUB MergeSort (l AS INTEGER, r AS INTEGER)
    DIM m AS INTEGER
    IF l < r THEN
        m = (l + r) \ 2
        MergeSort l, m
        MergeSort m + 1, r
        Merge l, m, r
    END IF
END SUB

CALL MergeSort(1, 6)
FOR i = 1 TO 6 : PRINT arr(i); : NEXT i
