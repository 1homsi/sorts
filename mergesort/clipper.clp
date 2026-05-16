PROCEDURE Main
    LOCAL arr := { 38, 27, 43, 3, 9, 82, 10 }
    LOCAL sorted := MergeSort( arr )
    LOCAL i
    FOR i := 1 TO Len( sorted )
        ? sorted[i]
    NEXT i
    RETURN

FUNCTION MergeSort( arr )
    LOCAL n := Len( arr ), mid, left, right
    IF n <= 1
        RETURN arr
    ENDIF
    mid := INT( n / 2 )
    left := MergeSort( SubArr( arr, 1, mid ) )
    right := MergeSort( SubArr( arr, mid + 1, n - mid ) )
    RETURN Merge( left, right )

FUNCTION Merge( left, right )
    LOCAL result := {}, i := 1, j := 1
    DO WHILE i <= Len(left) .AND. j <= Len(right)
        IF left[i] <= right[j]
            AAdd(result, left[i]); i := i + 1
        ELSE
            AAdd(result, right[j]); j := j + 1
        ENDIF
    ENDDO
    DO WHILE i <= Len(left): AAdd(result, left[i]); i := i + 1: ENDDO
    DO WHILE j <= Len(right): AAdd(result, right[j]); j := j + 1: ENDDO
    RETURN result
