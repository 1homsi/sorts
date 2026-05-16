PROCEDURE Main()
    LOCAL arr := {3, 7, 4, 8, 6, 2, 1, 5}
    BitonicSort(@arr, 1, Len(arr), .T.)
    AEval(arr, {|x| QOut(x, " ")})
    QOut()
RETURN

PROCEDURE CompSwap(arr, i, j, dir)
    LOCAL ai := arr[i], aj := arr[j]
    IF dir == (ai > aj)
        arr[i] := aj
        arr[j] := ai
    ENDIF
RETURN

PROCEDURE BitonicMerge(arr, lo, cnt, dir)
    LOCAL k, i
    IF cnt > 1
        k := Int(cnt / 2)
        FOR i := lo TO lo + k - 1
            CompSwap(@arr, i, i + k, dir)
        NEXT
        BitonicMerge(@arr, lo, k, dir)
        BitonicMerge(@arr, lo + k, k, dir)
    ENDIF
RETURN

PROCEDURE BitonicSort(arr, lo, cnt, dir)
    LOCAL k
    IF cnt > 1
        k := Int(cnt / 2)
        BitonicSort(@arr, lo, k, .T.)
        BitonicSort(@arr, lo + k, k, .F.)
        BitonicMerge(@arr, lo, cnt, dir)
    ENDIF
RETURN
