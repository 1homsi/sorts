FUNCTION GnomeSort(aArr)
    LOCAL i := 1, n := LEN(aArr), tmp
    DO WHILE i <= n
        IF i = 1 .OR. aArr[i] >= aArr[i - 1]
            i := i + 1
        ELSE
            tmp := aArr[i]
            aArr[i] := aArr[i - 1]
            aArr[i - 1] := tmp
            i := i - 1
        ENDIF
    ENDDO
    RETURN aArr
