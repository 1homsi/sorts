PROCEDURE Main()
    LOCAL arr := {5, 4, 3, 2, 1}
    LOCAL n := Len(arr)
    LOCAL writes := 0
    LOCAL cs, item, pos, i, tmp

    FOR cs := 1 TO n - 1
        item := arr[cs]
        pos := cs
        FOR i := cs + 1 TO n
            IF arr[i] < item THEN pos := pos + 1
        NEXT
        IF pos = cs THEN LOOP
        DO WHILE arr[pos] = item
            pos := pos + 1
        ENDDO
        tmp := arr[pos]; arr[pos] := item; item := tmp
        writes := writes + 1
        DO WHILE pos <> cs
            pos := cs
            FOR i := cs + 1 TO n
                IF arr[i] < item THEN pos := pos + 1
            NEXT
            DO WHILE arr[pos] = item
                pos := pos + 1
            ENDDO
            tmp := arr[pos]; arr[pos] := item; item := tmp
            writes := writes + 1
        ENDDO
    NEXT

    FOR i := 1 TO n
        ? arr[i]
    NEXT
RETURN
