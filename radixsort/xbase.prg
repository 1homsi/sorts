PROCEDURE Main()
    LOCAL arr[8], output[8], cnt[10]
    LOCAL i, idx, maxVal, exp
    arr[1]=170: arr[2]=45: arr[3]=75: arr[4]=90
    arr[5]=802: arr[6]=24: arr[7]=2:  arr[8]=66
    maxVal := arr[1]
    FOR i := 2 TO 8
        IF arr[i] > maxVal
            maxVal := arr[i]
        ENDIF
    NEXT
    exp := 1
    DO WHILE INT(maxVal / exp) > 0
        FOR i := 1 TO 10: cnt[i] := 0: NEXT
        FOR i := 1 TO 8
            idx := INT(arr[i] / exp) % 10 + 1
            cnt[idx]++
        NEXT
        FOR i := 2 TO 10
            cnt[i] += cnt[i-1]
        NEXT
        FOR i := 8 TO 1 STEP -1
            idx := INT(arr[i] / exp) % 10 + 1
            output[cnt[idx]] := arr[i]
            cnt[idx]--
        NEXT
        FOR i := 1 TO 8: arr[i] := output[i]: NEXT
        exp *= 10
    ENDDO
    FOR i := 1 TO 8
        ? arr[i]
    NEXT
RETURN
