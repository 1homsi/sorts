PROGRAM QUICKSORT;

PROCEDURE QUICKSORT;
VAR ARR[6], I, PIVOT, TEMP, J;
BEGIN
  ARR[0] := 5; ARR[1] := 2; ARR[2] := 8;
  ARR[3] := 1; ARR[4] := 9; ARR[5] := 3;

  PIVOT := ARR[0];
  I := 1;
  J := 6;

  WHILE I < J DO
    WHILE ARR[I] < PIVOT DO
      I := I + 1;
    END;
    WHILE ARR[J] > PIVOT DO
      J := J - 1;
    END;
    IF I < J THEN
      TEMP := ARR[I];
      ARR[I] := ARR[J];
      ARR[J] := TEMP;
      I := I + 1;
      J := J - 1;
    END;
  END;

  FOR I := 0 TO 5 DO
    WRITE ARR[I];
  END;
END;
BEGIN
  QUICKSORT;
END QUICKSORT.