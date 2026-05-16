DIM arr(8) AS INTEGER
DIM MIN_RUN AS INTEGER
MIN_RUN = 32

arr(0) = 5 : arr(1) = 2 : arr(2) = 8 : arr(3) = 1 : arr(4) = 9
arr(5) = 3 : arr(6) = 7 : arr(7) = 4 : arr(8) = 6

SUB InsertionSort(arr() AS INTEGER, left AS INTEGER, right AS INTEGER)
    DIM i AS INTEGER, j AS INTEGER, key AS INTEGER
    FOR i = left + 1 TO right
        key = arr(i)
        j = i - 1
        DO WHILE j >= left AND arr(j) > key
            arr(j + 1) = arr(j)
            j = j - 1
        LOOP
        arr(j + 1) = key
    NEXT i
END SUB

SUB MergeRuns(arr() AS INTEGER, left AS INTEGER, mid AS INTEGER, right AS INTEGER)
    DIM ln AS INTEGER, rn AS INTEGER
    ln = mid - left + 1
    rn = right - mid
    DIM lp(ln - 1) AS INTEGER, rp(rn - 1) AS INTEGER
    DIM i AS INTEGER, j AS INTEGER, k AS INTEGER
    FOR i = 0 TO ln - 1 : lp(i) = arr(left + i) : NEXT i
    FOR i = 0 TO rn - 1 : rp(i) = arr(mid + 1 + i) : NEXT i
    i = 0 : j = 0 : k = left
    DO WHILE i < ln AND j < rn
        IF lp(i) <= rp(j) THEN arr(k) = lp(i) : i = i + 1
        ELSE arr(k) = rp(j) : j = j + 1
        END IF
        k = k + 1
    LOOP
    DO WHILE i < ln : arr(k) = lp(i) : i = i + 1 : k = k + 1 : LOOP
    DO WHILE j < rn : arr(k) = rp(j) : j = j + 1 : k = k + 1 : LOOP
END SUB

DIM n AS INTEGER, i AS INTEGER, size AS INTEGER
DIM left AS INTEGER, mid AS INTEGER, right AS INTEGER
n = 9
i = 0
DO WHILE i < n
    right = i + MIN_RUN - 1
    IF right >= n THEN right = n - 1
    InsertionSort arr(), i, right
    i = i + MIN_RUN
LOOP
size = MIN_RUN
DO WHILE size < n
    left = 0
    DO WHILE left < n
        mid = left + size - 1
        IF mid >= n THEN mid = n - 1
        right = left + 2 * size - 1
        IF right >= n THEN right = n - 1
        IF mid < right THEN MergeRuns arr(), left, mid, right
        left = left + 2 * size
    LOOP
    size = size * 2
LOOP

FOR i = 0 TO n - 1
    PRINT arr(i); " ";
NEXT i
PRINT
