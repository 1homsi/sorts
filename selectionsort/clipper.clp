FUNCTION SelectionSort( arr )
    LOCAL n := LEN( arr )
    LOCAL i, j, minIdx, tmp
    FOR i := 1 TO n - 1
        minIdx := i
        FOR j := i + 1 TO n
            IF arr[ j ] < arr[ minIdx ]
                minIdx := j
            ENDIF
        NEXT j
        tmp := arr[ i ]
        arr[ i ] := arr[ minIdx ]
        arr[ minIdx ] := tmp
    NEXT i
    RETURN arr
