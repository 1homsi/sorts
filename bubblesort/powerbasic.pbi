FUNCTION PBMAIN() AS LONG
    DIM arr(1 TO 7) AS INTEGER
    arr(1)=64 : arr(2)=34 : arr(3)=25 : arr(4)=12
    arr(5)=22 : arr(6)=11 : arr(7)=90
    DIM n AS INTEGER : n = 7
    DIM sw AS INTEGER
    DIM tmp AS INTEGER
    DO
        sw = 0
        DIM i AS INTEGER
        FOR i = 1 TO n - 1
            IF arr(i) > arr(i+1) THEN
                tmp = arr(i) : arr(i) = arr(i+1) : arr(i+1) = tmp : sw = 1
            END IF
        NEXT i
        n = n - 1
    LOOP WHILE sw = 1
    FOR i = 1 TO 7
        PRINT STR$(arr(i))
    NEXT i
END FUNCTION
