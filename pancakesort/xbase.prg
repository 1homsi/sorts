PROCEDURE Main
    LOCAL arr := {3, 6, 2, 7, 4, 1, 5}
    LOCAL size := Len(arr)
    LOCAL maxIdx, i

    DO WHILE size > 1
        maxIdx := 1
        FOR i := 2 TO size
            IF arr[i] > arr[maxIdx]
                maxIdx := i
            ENDIF
        NEXT
        IF maxIdx # size
            IF maxIdx # 1
                arr := Flip(arr, maxIdx - 1)
            ENDIF
            arr := Flip(arr, size - 1)
        ENDIF
        size--
    ENDDO

    ? arr
    RETURN

FUNCTION Flip(arr, k)
    LOCAL left := 1, right := k + 1, tmp
    DO WHILE left < right
        tmp := arr[left]
        arr[left] := arr[right]
        arr[right] := tmp
        left++
        right--
    ENDDO
    RETURN arr
