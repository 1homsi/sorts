PROGRAM RADIX_SORT
    INTEGER :: N, MAX_VAL, EXP, I, IDX
    INTEGER, ALLOCATABLE :: ARR(:), OUTPUT(:), COUNT(:)
    
    ALLOCATE(ARR(1000))
    ALLOCATE(OUTPUT(1000))
    ALLOCATE(COUNT(10))
    
    N = SIZE(ARR)
    IF (N == 0) RETURN
    
    MAX_VAL = MAXVAL(ARR)
    EXP = 1
    
    DO WHILE (MAX_VAL / EXP > 0)
        COUNT = 0
        DO I = 1, N
            IDX = MOD(ARR(I) / EXP, 10) + 1
            COUNT(IDX) = COUNT(IDX) + 1
        END DO
        
        DO I = 2, 10
            COUNT(I) = COUNT(I) + COUNT(I-1)
        END DO
        
        DO I = N, 1, -1
            IDX = MOD(ARR(I) / EXP, 10) + 1
            OUTPUT(COUNT(IDX)) = ARR(I)
            COUNT(IDX) = COUNT(IDX) - 1
        END DO
        
        ARR = OUTPUT
        EXP = EXP * 10
    END DO
END PROGRAM RADIX_SORT