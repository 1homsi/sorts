PROGRAM COUNTINGSORT

BEGIN
  INT ARRAY[6]
  INT MAX
  INT COUNT_ARR[10]
  INT OUTPUT[10]
  INT I
  INT J

  ARRAY[0] := 5
  ARRAY[1] := 2
  ARRAY[2] := 8
  ARRAY[3] := 1
  ARRAY[4] := 9
  ARRAY[5] := 3

  MAX := 0
  I := 0
  DO WHILE (I < 6)
    IF ARRAY[I] > MAX THEN
      MAX := ARRAY[I]
    ENDIF
    I := I + 1
  ENDDO

  I := 0
  DO WHILE (I <= 9)
    COUNT_ARR[I] := 0
    I := I + 1
  ENDDO

  I := 0
  DO WHILE (I < 6)
    COUNT_ARR[ARRAY[I]] := COUNT_ARR[ARRAY[I]] + 1
    I := I + 1
  ENDDO

  I := 0
  J := 0
  DO WHILE (I <= MAX)
    DO WHILE (J < COUNT_ARR[I])
      OUTPUT[J] := I
      J := J + 1
    ENDDO
    I := I + 1
  ENDDO

  PRINT "Result: "
  PRINT OUTPUT
END PROGRAM
