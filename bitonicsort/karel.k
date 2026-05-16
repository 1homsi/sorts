PROGRAM BitSortDemo
    VAR arr[8], lo, cnt, dir, k, i, tmp

    PROCEDURE bitonicsort
        IF cnt > 1
            k := cnt / 2
            cnt := k
            dir := 1
            CALL bitonicsort
            dir := 0
            cnt := k
            lo := lo + k
            CALL bitonicsort
            lo := lo - k
            cnt := cnt * 2
            CALL bitonicmerge
        END
    END

    PROCEDURE bitonicmerge
        IF cnt > 1
            k := cnt / 2
            FOR i := lo TO lo + cnt - k - 1
                IF (arr[i] > arr[i + k]) = (dir = 1)
                    tmp := arr[i]
                    arr[i] := arr[i + k]
                    arr[i + k] := tmp
                END
            END
            cnt := k
            CALL bitonicmerge
            lo := lo + k
            cnt := k
            CALL bitonicmerge
            lo := lo - k
        END
    END

    BEGIN
        arr[1] := 5; arr[2] := 2; arr[3] := 8; arr[4] := 1
        arr[5] := 9; arr[6] := 3; arr[7] := 7; arr[8] := 4
        lo := 1
        cnt := 8
        dir := 1
        CALL bitonicsort
        PRINT arr
    END
END
