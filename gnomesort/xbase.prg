FUNCTION GnomeSort(aArr)
    LOCAL i := 1, n := LEN(aArr), cTmp
    DO WHILE i <= n
        IF i = 1 .OR. aArr[i] >= aArr[i - 1]
            i++
        ELSE
            cTmp := aArr[i]
            aArr[i] := aArr[i - 1]
            aArr[i - 1] := cTmp
            i--
        ENDIF
    ENDDO
    RETURN aArr
