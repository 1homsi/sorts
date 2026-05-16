BEGIN
  INTEGER ARRAY ARR[1:6];
  INTEGER N, POS, ITEM, CYCLES, I, TEMP;
  N := 6;
  ARR[1] := 5; ARR[2] := 2; ARR[3] := 8; ARR[4] := 1; ARR[5] := 9; ARR[6] := 3;
  
  POS := 1;
  WHILE POS <= N DO
  BEGIN
    ITEM := ARR[POS];
    CYCLES := 0;
    FOR I := 1 STEP 1 UNTIL N DO
      IF I /= POS AND ARR[I] < ITEM THEN
        CYCLES := CYCLES + 1;
    IF CYCLES /= 0 THEN
    BEGIN
      WHILE ARR[POS] = ITEM DO
        POS := POS + 1;
      TEMP := ARR[POS];
      ARR[POS] := ITEM;
      ITEM := TEMP;
      WHILE CYCLES > 0 DO
      BEGIN
        CYCLES := 0;
        FOR I := 1 STEP 1 UNTIL N DO
          IF I /= POS AND ARR[I] < ITEM THEN
            CYCLES := CYCLES + 1;
        WHILE ARR[POS] = ITEM DO
          POS := POS + 1;
        TEMP := ARR[POS];
        ARR[POS] := ITEM;
        ITEM := TEMP;
        CYCLES := CYCLES - 1
      END
    END;
    POS := POS + 1
  END
END.
