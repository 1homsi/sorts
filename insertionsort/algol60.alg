BEGIN
  INTEGER PROCEDURE INSERTIONSORT(ARR, N);
    INTEGER ARRAY ARR; INTEGER N;
    BEGIN INTEGER I, J, KEY;
      FOR I := 2 STEP 1 UNTIL N DO
        BEGIN KEY := ARR[I];
          J := I - 1;
          WHILE J > 0 AND ARR[J] > KEY DO
            BEGIN ARR[J+1] := ARR[J];
              J := J - 1;
            END;
          ARR[J+1] := KEY;
        END;
    END;
  INTEGER ARRAY ARR[1:6];
  ARR[1] := 5; ARR[2] := 2; ARR[3] := 8; ARR[4] := 1; ARR[5] := 9; ARR[6] := 3;
  INSERTIONSORT(ARR, 6);
  FOR I := 1 STEP 1 UNTIL 6 DO
    OUTINTEGER(ARR[I]);
END