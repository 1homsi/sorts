PROGRAM GnomeSort;

VAR arr: ARRAY [0..5] OF INTEGER;
    i, temp: INTEGER;

PROCEDURE Gnomesort;
BEGIN
  i := 0;
  WHILE i < 6 DO
  BEGIN
    IF i = 0 THEN
      i := i + 1
    ELSE
    BEGIN
      IF arr[i] < arr[i - 1] THEN
      BEGIN
        temp := arr[i];
        arr[i] := arr[i - 1];
        arr[i - 1] := temp;
        i := i - 1;
      END
      ELSE
        i := i + 1;
    END;
  END;
END;

BEGIN
  arr[0] := 5;
  arr[1] := 2;
  arr[2] := 8;
  arr[3] := 1;
  arr[4] := 9;
  arr[5] := 3;

  Gnomesort;

  FOR i := 0 TO 5 DO
    WRITELN(arr[i]);
END.
