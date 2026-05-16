PROCEDURE Main()
    LOCAL arr := {12, 11, 13, 5, 6, 7}
    HeapSort( arr )
    AEval( arr, {|x| QOut( x, " " )} )
    QOut()
RETURN

PROCEDURE HeapSort( arr )
    LOCAL n := Len( arr ), i, tmp
    FOR i := Int(n/2) TO 1 STEP -1
        Heapify( arr, n, i )
    NEXT
    FOR i := n TO 2 STEP -1
        tmp := arr[1]; arr[1] := arr[i]; arr[i] := tmp
        Heapify( arr, i-1, 1 )
    NEXT
RETURN

PROCEDURE Heapify( arr, n, i )
    LOCAL largest := i, left := 2*i, right := 2*i+1, tmp
    IF left <= n .AND. arr[left] > arr[largest]; largest := left; ENDIF
    IF right <= n .AND. arr[right] > arr[largest]; largest := right; ENDIF
    IF largest != i
        tmp := arr[i]; arr[i] := arr[largest]; arr[largest] := tmp
        Heapify( arr, n, largest )
    ENDIF
RETURN
