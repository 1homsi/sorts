PROCEDURE Main()
    LOCAL arr := {64, 34, 25, 12, 22, 11, 90}
    LOCAL n := Len(arr)
    LOCAL gap := Int(n / 2)
    LOCAL i, j, temp
    DO WHILE gap > 0
        FOR i := gap + 1 TO n
            temp := arr[i]
            j := i
            DO WHILE j > gap .AND. arr[j - gap] > temp
                arr[j] := arr[j - gap]
                j -= gap
            ENDDO
            arr[j] := temp
        NEXT
        gap := Int(gap / 2)
    ENDDO
    AEval(arr, {|v| QOut(v, " ")})
    QOut()
RETURN
