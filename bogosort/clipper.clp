FUNCTION Main()
    LOCAL arr := {3, 1, 4, 1, 5, 9, 2, 6}
    LOCAL n := Len(arr)
    LOCAL sorted, i, j, tmp

    DO WHILE .T.
        sorted := .T.
        FOR i := 1 TO n - 1
            IF arr[i] > arr[i + 1]
                sorted := .F.
            ENDIF
        NEXT
        IF sorted
            EXIT
        ENDIF
        FOR i := n TO 2 STEP -1
            j := INT(RAND() * i) + 1
            tmp := arr[i]
            arr[i] := arr[j]
            arr[j] := tmp
        NEXT
    ENDDO

    FOR i := 1 TO n
        ? arr[i]
    NEXT
RETURN
