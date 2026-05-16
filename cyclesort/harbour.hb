PROCEDURE Main()
    LOCAL arr := {5, 4, 3, 2, 1}
    CycleSort(arr)
    AEval(arr, {|x| QOut(x, "")})
    QOut()
RETURN

PROCEDURE CycleSort(arr)
    LOCAL n := Len(arr)
    LOCAL writes := 0
    LOCAL cycleStart, item, pos, i, tmp
    FOR cycleStart := 1 TO n - 1
        item := arr[cycleStart]
        pos := cycleStart
        FOR i := cycleStart + 1 TO n
            IF arr[i] < item
                pos++
            ENDIF
        NEXT
        IF pos == cycleStart
            LOOP
        ENDIF
        DO WHILE arr[pos] == item
            pos++
        ENDDO
        tmp := arr[pos]; arr[pos] := item; item := tmp
        writes++
        DO WHILE pos != cycleStart
            pos := cycleStart
            FOR i := cycleStart + 1 TO n
                IF arr[i] < item
                    pos++
                ENDIF
            NEXT
            DO WHILE arr[pos] == item
                pos++
            ENDDO
            tmp := arr[pos]; arr[pos] := item; item := tmp
            writes++
        ENDDO
    NEXT
RETURN
