BEGIN
  INTEGER ARRAY ARR[1:6];
  INTEGER N, I, J, MIN_IDX, TMP;
  
  ARR[1] := 5; ARR[2] := 2; ARR[3] := 8;
  ARR[4] := 1; ARR[5] := 9; ARR[6] := 3;
  N := 6;
  
  FOR I := 1 STEP 1 UNTIL N - 1 DO BEGIN
    MIN_IDX := I;
    FOR J := I + 1 STEP 1 UNTIL N DO BEGIN
      IF ARR[J] < ARR[MIN_IDX] THEN MIN_IDX := J;
    END;
    TMP := ARR[I];
    ARR[I] := ARR[MIN_IDX];
    ARR[MIN_IDX] := TMP;
  END;
  
  FOR I := 1 STEP 1 UNTIL N DO
    OUTREAL(ARR[I]);
END