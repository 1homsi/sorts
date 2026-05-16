BEGIN
  INTEGER ARRAY A[1:6];
  A[1] := 5; A[2] := 2; A[3] := 8; A[4] := 1; A[5] := 9; A[6] := 3;
  BEGIN
    INTEGER N, GAP, I, J, TEMP;
    N := 6;
    GAP := 1;
    WHILE GAP <= N DO GAP := GAP * 3 + 1;
    WHILE GAP > 0 DO BEGIN
      GAP := GAP ÷ 3;
      FOR I := GAP + 1 STEP 1 UNTIL N DO BEGIN
        TEMP := A[I];
        J := I;
        WHILE J > GAP AND A[J - GAP] > TEMP DO BEGIN
          A[J] := A[J - GAP];
          J := J - GAP;
        END;
        A[J] := TEMP;
      END;
    END;
  END;
  FOR I := 1 STEP 1 UNTIL 6 DO PRINT(A[I]);
END
