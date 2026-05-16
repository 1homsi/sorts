BEGIN
  INTEGER ARRAY ARR[1:6];
  INTEGER N, I, K, TEMP;
  BOOLEAN SWAPPED;
  
  ARR[1] := 5; ARR[2] := 2; ARR[3] := 8; ARR[4] := 1; ARR[5] := 9; ARR[6] := 3;
  N := 6;
  I := 0;
  
  WHILE I < N DO BEGIN
    SWAPPED := FALSE;
    FOR K := 1 STEP 1 UNTIL N - I - 1 DO BEGIN
      IF ARR[K] > ARR[K + 1] THEN BEGIN
        TEMP := ARR[K];
        ARR[K] := ARR[K + 1];
        ARR[K + 1] := TEMP;
        SWAPPED := TRUE;
      END;
    END;
    IF NOT SWAPPED THEN GOTO DONE;
    I := I + 1;
    SWAPPED := FALSE;
    FOR K := N - I - 1 STEP -1 UNTIL 1 DO BEGIN
      IF ARR[K] > ARR[K + 1] THEN BEGIN
        TEMP := ARR[K];
        ARR[K] := ARR[K + 1];
        ARR[K + 1] := TEMP;
        SWAPPED := TRUE;
      END;
    END;
    IF NOT SWAPPED THEN GOTO DONE;
    I := I + 1;
  END;
  DONE: PRINT ARR;
END
