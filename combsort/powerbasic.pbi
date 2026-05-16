SUB CombSort(arr() AS INTEGER, n AS INTEGER)
    DIM gap AS INTEGER
    DIM sorted AS INTEGER
    DIM tmp AS INTEGER
    DIM i AS INTEGER
    gap = n
    sorted = 0
    DO WHILE sorted = 0
        gap = INT(gap / 1.3)
        IF gap < 1 THEN gap = 1
        IF gap = 1 THEN sorted = 1
        FOR i = 0 TO n - gap - 1
            IF arr(i) > arr(i + gap) THEN
                tmp = arr(i)
                arr(i) = arr(i + gap)
                arr(i + gap) = tmp
                sorted = 0
            END IF
        NEXT i
    LOOP
END SUB
