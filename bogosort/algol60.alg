BEGIN
  INTEGER ARRAY A[1:3];
  INTEGER I, J, N, T, SORTED;

  PROCEDURE BOGOSORT;
  BEGIN
    N := 3;
    SORTED := 0;
    WHILE SORTED = 0 DO
    BEGIN
      SORTED := 1;
      FOR I := 1 STEP 1 UNTIL N-1 DO
      BEGIN
        IF A[I] > A[I+1] THEN SORTED := 0;
      END;
      IF SORTED = 0 THEN
      BEGIN
        FOR I := 1 STEP 1 UNTIL N DO
        BEGIN
          J := ENTIER(RANDOM * N) + 1;
          T := A[I];
          A[I] := A[J];
          A[J] := T;
        END;
      END;
    END;
  END;

  A[1] := 3; A[2] := 1; A[3] := 2;
  BOGOSORT;
  PRINT(A[1]); PRINT(A[2]); PRINT(A[3]);
END
