BEGIN
  PROCEDURE STOOGESORT(A, I, J);
  INTEGER ARRAY A;
  INTEGER I, J;
  BEGIN
    INTEGER TEMP, T;
    IF A[J] < A[I] THEN BEGIN
      TEMP := A[J];
      A[J] := A[I];
      A[I] := TEMP;
    END;
    IF J - I > 1 THEN BEGIN
      T := (J - I + 1) / 3;
      STOOGESORT(A, I, J - T);
      STOOGESORT(A, I + T, J);
      STOOGESORT(A, I, J - T);
    END;
  END STOOGESORT;
  
  INTEGER ARRAY ARR[1:6];
  ARR[1] := 5; ARR[2] := 2; ARR[3] := 8;
  ARR[4] := 1; ARR[5] := 9; ARR[6] := 3;
  STOOGESORT(ARR, 1, 6);
  OUTREAL(1, ARR[1]);
END
