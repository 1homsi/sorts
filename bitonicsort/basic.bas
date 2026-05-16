DIM arr(7) AS INTEGER
arr(0) = 3: arr(1) = 7: arr(2) = 4: arr(3) = 8
arr(4) = 6: arr(5) = 2: arr(6) = 1: arr(7) = 5

CALL BitonicSort(0, 8, 1)

FOR i = 0 TO 7
    PRINT arr(i);
NEXT i
PRINT

END

SUB CompareAndSwap(i AS INTEGER, j AS INTEGER, dir AS INTEGER)
    IF dir = 1 THEN
        IF arr(i) > arr(j) THEN
            SWAP arr(i), arr(j)
        END IF
    ELSE
        IF arr(i) < arr(j) THEN
            SWAP arr(i), arr(j)
        END IF
    END IF
END SUB

SUB BitonicMerge(lo AS INTEGER, cnt AS INTEGER, dir AS INTEGER)
    IF cnt > 1 THEN
        k = cnt \ 2
        FOR i = lo TO lo + k - 1
            CALL CompareAndSwap(i, i + k, dir)
        NEXT i
        CALL BitonicMerge(lo, k, dir)
        CALL BitonicMerge(lo + k, k, dir)
    END IF
END SUB

SUB BitonicSort(lo AS INTEGER, cnt AS INTEGER, dir AS INTEGER)
    IF cnt > 1 THEN
        k = cnt \ 2
        CALL BitonicSort(lo, k, 1)
        CALL BitonicSort(lo + k, k, 0)
        CALL BitonicMerge(lo, cnt, dir)
    END IF
END SUB
