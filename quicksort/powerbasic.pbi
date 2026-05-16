DIM arr(6) AS LONG
arr(0)=3:arr(1)=6:arr(2)=8:arr(3)=10
arr(4)=1:arr(5)=2:arr(6)=1

FUNCTION Partition(low AS LONG, high AS LONG) AS LONG
    LOCAL pivot AS LONG, i AS LONG, j AS LONG, tmp AS LONG
    pivot = arr(high): i = low
    FOR j = low TO high - 1
        IF arr(j) <= pivot THEN
            tmp = arr(i): arr(i) = arr(j): arr(j) = tmp
            INCR i
        END IF
    NEXT j
    tmp = arr(i): arr(i) = arr(high): arr(high) = tmp
    FUNCTION = i
END FUNCTION

SUB QuickSort(low AS LONG, high AS LONG)
    LOCAL p AS LONG
    IF low < high THEN
        p = Partition(low, high)
        QuickSort(low, p - 1)
        QuickSort(p + 1, high)
    END IF
END SUB

QuickSort 0, 6
FOR i AS LONG = 0 TO 6
    PRINT arr(i); " ";
NEXT
PRINT
