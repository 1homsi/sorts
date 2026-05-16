FUNCTION CombSort( arr, n )
    LOCAL gap := n
    LOCAL sorted := .F.
    LOCAL tmp
    DO WHILE ! sorted
        gap := INT( gap / 1.3 )
        IF gap <= 1
            gap := 1
            sorted := .T.
        ENDIF
        FOR LOCAL i := 1 TO n - gap
            IF arr[ i ] > arr[ i + gap ]
                tmp := arr[ i ]
                arr[ i ] := arr[ i + gap ]
                arr[ i + gap ] := tmp
                sorted := .F.
            ENDIF
        NEXT
    ENDDO
    RETURN arr
