PROCEDURE Main()
    LOCAL arr := { 3, 6, 8, 10, 1, 2, 1 }
    QuickSort( arr, 1, Len(arr) )
    LOCAL i
    FOR i := 1 TO Len(arr)
        ? arr[i]
    NEXT
    RETURN

FUNCTION Partition( arr, low, high )
    LOCAL pivot := arr[high]
    LOCAL i := low, j, tmp
    FOR j := low TO high - 1
        IF arr[j] <= pivot
            tmp := arr[i]; arr[i] := arr[j]; arr[j] := tmp
            i++
        ENDIF
    NEXT
    tmp := arr[i]; arr[i] := arr[high]; arr[high] := tmp
    RETURN i

PROCEDURE QuickSort( arr, low, high )
    IF low < high
        LOCAL p := Partition( arr, low, high )
        QuickSort( arr, low, p - 1 )
        QuickSort( arr, p + 1, high )
    ENDIF
    RETURN
