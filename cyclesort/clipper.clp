PROCEDURE Main()
    LOCAL aArr := {5, 4, 3, 2, 1}
    LOCAL nN := 5, nWrites := 0
    LOCAL nCs, nItem, nPos, nI, nTmp

    FOR nCs := 1 TO nN - 1
        nItem := aArr[nCs]
        nPos := nCs
        FOR nI := nCs + 1 TO nN
            IF aArr[nI] < nItem
                nPos := nPos + 1
            ENDIF
        NEXT
        IF nPos == nCs
            LOOP
        ENDIF
        DO WHILE aArr[nPos] == nItem
            nPos := nPos + 1
        ENDDO
        nTmp := aArr[nPos]; aArr[nPos] := nItem; nItem := nTmp
        nWrites := nWrites + 1
        DO WHILE nPos <> nCs
            nPos := nCs
            FOR nI := nCs + 1 TO nN
                IF aArr[nI] < nItem
                    nPos := nPos + 1
                ENDIF
            NEXT
            DO WHILE aArr[nPos] == nItem
                nPos := nPos + 1
            ENDDO
            nTmp := aArr[nPos]; aArr[nPos] := nItem; nItem := nTmp
            nWrites := nWrites + 1
        ENDDO
    NEXT

    AEval(aArr, {|x| QOut(x)})
RETURN
