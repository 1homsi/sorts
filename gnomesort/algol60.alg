BEGIN
  INTEGER ARRAY ARR[1:6];
  INTEGER I, TEMP;
  ARR[1] := 5;
  ARR[2] := 2;
  ARR[3] := 8;
  ARR[4] := 1;
  ARR[5] := 9;
  ARR[6] := 3;

  I := 1;
  WHILE I <= 6 DO
  BEGIN
    IF I = 1 THEN
      I := I + 1
    ELSE IF ARR[I] < ARR[I-1] THEN
    BEGIN
      TEMP := ARR[I];
      ARR[I] := ARR[I-1];
      ARR[I-1] := TEMP;
      I := I - 1;
    END
    ELSE
      I := I + 1;
  END;

  FOR I := 1 STEP 1 UNTIL 6 DO
    PRINT(ARR[I]);
END
