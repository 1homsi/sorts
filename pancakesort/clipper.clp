PROCEDURE Main
    LOCAL arr[7], size, maxIdx, i
    arr[1]=3 ; arr[2]=6 ; arr[3]=2 ; arr[4]=7
    arr[5]=4 ; arr[6]=1 ; arr[7]=5
    size := 7

    DO WHILE size > 1
        maxIdx := 1
        FOR i := 2 TO size
            IF arr[i] > arr[maxIdx]
                maxIdx := i
            ENDIF
        NEXT
        IF maxIdx # size
            IF maxIdx # 1
                FLIP(arr, maxIdx - 1)
            ENDIF
            FLIP(arr, size - 1)
        ENDIF
        size--
    ENDDO

    FOR i := 1 TO 7
        ?? arr[i], " "
    NEXT
    ?
    RETURN

PROCEDURE FLIP(arr, k)
    LOCAL left := 1, right := k + 1, tmp
    DO WHILE left < right
        tmp := arr[left]
        arr[left] := arr[right]
        arr[right] := tmp
        left++ ; right--
    ENDDO
    RETURN
