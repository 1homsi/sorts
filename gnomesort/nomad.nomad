FUNCTION GNOME_SORT(ARR, N)
    I = 0
    WHILE I < N DO
        IF I = 0 OR ARR[I] >= ARR[I-1] THEN
            I = I + 1
        ELSE
            TMP = ARR[I]
            ARR[I] = ARR[I-1]
            ARR[I-1] = TMP
            I = I - 1
        END
    END
    RETURN ARR
END
