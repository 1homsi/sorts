MODULE GnomeSort;

PROCEDURE Sort(VAR arr : ARRAY OF INTEGER);
  VAR i, temp : INTEGER;
BEGIN
  i := 0;
  WHILE i < LEN(arr) DO
    IF i = 0 THEN
      INC(i)
    ELSIF arr[i] < arr[i - 1] THEN
      temp := arr[i];
      arr[i] := arr[i - 1];
      arr[i - 1] := temp;
      DEC(i)
    ELSE
      INC(i)
    END
  END
END Sort;

PROCEDURE Main;
  VAR test : ARRAY 6 OF INTEGER;
      i : INTEGER;
BEGIN
  test[0] := 5;
  test[1] := 2;
  test[2] := 8;
  test[3] := 1;
  test[4] := 9;
  test[5] := 3;
  Sort(test);
  FOR i := 0 TO 5 DO
    Out.Int(test[i], 0); Out.Char(' ')
  END
END Main;

BEGIN Main
END GnomeSort.
