DIM arr(100) AS INTEGER
DIM n AS INTEGER
DIM swapped AS INTEGER
DIM start AS INTEGER
DIM ending AS INTEGER
DIM i AS INTEGER
DIM tmp AS INTEGER

SUB cocktailSort()
    swapped = 1
    start = 0
    ending = n - 1
    WHILE swapped
        swapped = 0
        FOR i = start TO ending - 1
            IF arr(i) > arr(i + 1) THEN
                tmp = arr(i)
                arr(i) = arr(i + 1)
                arr(i + 1) = tmp
                swapped = 1
            END IF
        NEXT i
        IF swapped = 0 THEN EXIT SUB
        swapped = 0
        ending = ending - 1
        FOR i = ending - 1 TO start STEP -1
            IF arr(i) > arr(i + 1) THEN
                tmp = arr(i)
                arr(i) = arr(i + 1)
                arr(i + 1) = tmp
                swapped = 1
            END IF
        NEXT i
        start = start + 1
    WEND
END SUB
