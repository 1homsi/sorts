FUNCTION InsertionSort(arr, n)
    LOCAL i, j, key
    FOR i := 2 TO n
        key := arr[i]
        j := i - 1
        DO WHILE j >= 1 .AND. arr[j] > key
            arr[j+1] := arr[j]
            j--
        ENDDO
        arr[j+1] := key
    NEXT i
RETURN arr
