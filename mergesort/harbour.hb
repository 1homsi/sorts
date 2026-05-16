PROCEDURE Main()
    LOCAL arr := { 38, 27, 43, 3, 9, 82, 10 }
    LOCAL sorted := MergeSort( arr )
    LOCAL i
    FOR i := 1 TO Len( sorted )
        QOut( sorted[i] )
    NEXT
    RETURN

FUNCTION MergeSort( arr )
    LOCAL n := Len( arr ), mid, left, right
    IF n <= 1
        RETURN arr
    ENDIF
    mid := Int( n / 2 )
    left := MergeSort( ASlice( arr, 1, mid ) )
    right := MergeSort( ASlice( arr, mid + 1, n ) )
    RETURN Merge( left, right )

FUNCTION Merge( left, right )
    LOCAL result := {}, i := 1, j := 1
    DO WHILE i <= Len( left ) .AND. j <= Len( right )
        IF left[i] <= right[j]
            AAdd( result, left[i] ); i++
        ELSE
            AAdd( result, right[j] ); j++
        ENDIF
    ENDDO
    DO WHILE i <= Len( left ): AAdd( result, left[i] ); i++: ENDDO
    DO WHILE j <= Len( right ): AAdd( result, right[j] ); j++: ENDDO
    RETURN result
