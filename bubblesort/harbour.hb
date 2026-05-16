PROCEDURE Main()
    LOCAL arr := { 64, 34, 25, 12, 22, 11, 90 }
    LOCAL n := Len(arr), i, tmp
    LOCAL lSwapped := .T.

    DO WHILE lSwapped
        lSwapped := .F.
        FOR i := 1 TO n - 1
            IF arr[i] > arr[i + 1]
                tmp := arr[i]
                arr[i] := arr[i + 1]
                arr[i + 1] := tmp
                lSwapped := .T.
            ENDIF
        NEXT
        n--
    ENDDO

    FOR i := 1 TO 7
        ?? arr[i], " "
    NEXT
    ?
RETURN
