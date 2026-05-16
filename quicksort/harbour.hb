PROCEDURE Main()
    LOCAL arr := { 3, 6, 8, 10, 1, 2, 1 }
    QuickSort( arr, 1, Len(arr) )
    AEval( arr, {|x| QOut(x, " ")} )
    QOutNL()
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
    LOCAL p
    IF low < high
        p := Partition( arr, low, high )
        QuickSort( arr, low, p - 1 )
        QuickSort( arr, p + 1, high )
    ENDIF
    RETURN
