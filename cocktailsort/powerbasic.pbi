SUB CocktailSort(arr() AS LONG, n AS LONG)
    DIM swapped AS LONG
    DIM start AS LONG, ending AS LONG, i AS LONG, tmp AS LONG
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
        DECR ending
        FOR i = ending - 1 TO start STEP -1
            IF arr(i) > arr(i + 1) THEN
                tmp = arr(i)
                arr(i) = arr(i + 1)
                arr(i + 1) = tmp
                swapped = 1
            END IF
        NEXT i
        INCR start
    WEND
END SUB
