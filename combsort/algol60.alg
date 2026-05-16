BEGIN
  INTEGER ARRAY A[1:6];
  INTEGER GAP, I, TEMP, LEN;
  BOOLEAN SWAPPED;

  A[1] := 5; A[2] := 2; A[3] := 8; A[4] := 1; A[5] := 9; A[6] := 3;
  LEN := 6;
  GAP := LEN;

  WHILE GAP > 1 OR SWAPPED DO BEGIN
    GAP := ENTIER(GAP * 10 / 13);
    IF GAP < 1 THEN GAP := 1;
    SWAPPED := FALSE;
    FOR I := 1 STEP 1 UNTIL LEN - GAP DO BEGIN
      IF A[I] > A[I + GAP] THEN BEGIN
        TEMP := A[I];
        A[I] := A[I + GAP];
        A[I + GAP] := TEMP;
        SWAPPED := TRUE;
      END;
    END;
  END;

  FOR I := 1 STEP 1 UNTIL 6 DO
    PRINT A[I];
END
