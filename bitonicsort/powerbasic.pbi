DIM arr(0 TO 7) AS INTEGER
arr(0)=3: arr(1)=7: arr(2)=4: arr(3)=8
arr(4)=6: arr(5)=2: arr(6)=1: arr(7)=5

SUB CompSwap(i AS INTEGER, j AS INTEGER, dir AS INTEGER)
    IF (dir=1 AND arr(i)>arr(j)) OR (dir=0 AND arr(i)<arr(j)) THEN
        SWAP arr(i), arr(j)
    END IF
END SUB

SUB BitonicMerge(lo AS INTEGER, cnt AS INTEGER, dir AS INTEGER)
    IF cnt > 1 THEN
        k = cnt \ 2
        FOR i = lo TO lo+k-1
            CompSwap i, i+k, dir
        NEXT
        BitonicMerge lo, k, dir
        BitonicMerge lo+k, k, dir
    END IF
END SUB

SUB BitonicSort(lo AS INTEGER, cnt AS INTEGER, dir AS INTEGER)
    IF cnt > 1 THEN
        k = cnt \ 2
        BitonicSort lo, k, 1
        BitonicSort lo+k, k, 0
        BitonicMerge lo, cnt, dir
    END IF
END SUB

BitonicSort 0, 8, 1
FOR i = 0 TO 7
    PRINT arr(i); " ";
NEXT
PRINT
