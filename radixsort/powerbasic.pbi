FUNCTION CountingSort(arr() AS LONG, exp AS LONG) AS LONG
    DIM n AS LONG, i AS LONG, idx AS LONG
    DIM output(UBOUND(arr)) AS LONG
    DIM cnt(9) AS LONG
    n = UBOUND(arr) + 1
    FOR i = 0 TO n-1
        idx = (arr(i) \ exp) MOD 10
        cnt(idx) = cnt(idx) + 1
    NEXT
    FOR i = 1 TO 9
        cnt(i) = cnt(i) + cnt(i-1)
    NEXT
    FOR i = n-1 TO 0 STEP -1
        idx = (arr(i) \ exp) MOD 10
        cnt(idx) = cnt(idx) - 1
        output(cnt(idx)) = arr(i)
    NEXT
    FOR i = 0 TO n-1
        arr(i) = output(i)
    NEXT
END FUNCTION

FUNCTION RadixSort(arr() AS LONG) AS LONG
    DIM maxVal AS LONG, exp AS LONG, i AS LONG
    maxVal = arr(0)
    FOR i = 1 TO UBOUND(arr)
        IF arr(i) > maxVal THEN maxVal = arr(i)
    NEXT
    exp = 1
    DO WHILE maxVal \ exp > 0
        CountingSort(arr(), exp)
        exp = exp * 10
    LOOP
END FUNCTION

DIM arr(7) AS LONG
arr(0)=170:arr(1)=45:arr(2)=75:arr(3)=90
arr(4)=802:arr(5)=24:arr(6)=2:arr(7)=66
RadixSort(arr())
FOR i = 0 TO 7
    PRINT arr(i); " ";
NEXT
PRINT
