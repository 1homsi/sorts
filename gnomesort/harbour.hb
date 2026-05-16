FUNCTION GnomeSort(aArr)
    LOCAL i := 1, n := Len(aArr), tmp
    DO WHILE i <= n
        IF i = 1 .OR. aArr[i] >= aArr[i - 1]
            i++
        ELSE
            tmp := aArr[i]
            aArr[i] := aArr[i - 1]
            aArr[i - 1] := tmp
            i--
        ENDIF
    ENDDO
    RETURN aArr
