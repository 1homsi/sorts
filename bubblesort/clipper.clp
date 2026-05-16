PROCEDURE Main
    LOCAL arr[7], n, i, tmp, swapped
    arr[1]:=64 ; arr[2]:=34 ; arr[3]:=25 ; arr[4]:=12
    arr[5]:=22 ; arr[6]:=11 ; arr[7]:=90
    n := 7
    DO WHILE .T.
        swapped := .F.
        FOR i := 1 TO n-1
            IF arr[i] > arr[i+1]
                tmp := arr[i] ; arr[i] := arr[i+1] ; arr[i+1] := tmp
                swapped := .T.
            ENDIF
        NEXT
        n--
        IF !swapped ; EXIT ; ENDIF
    ENDDO
    FOR i := 1 TO 7 ; ? arr[i] ; NEXT
RETURN
