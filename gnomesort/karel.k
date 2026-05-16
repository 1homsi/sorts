PROGRAM GnomeSort;

CONST N = 6;

VAR
  arr: ARRAY[1..N] OF INTEGER;
  i, temp: INTEGER;

PROCEDURE Gnomesort;
BEGIN
  i := 1;
  WHILE i <= N DO
  BEGIN
    IF i = 1 THEN
      i := i + 1
    ELSE
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

BEGIN
  arr[1] := 5;
  arr[2] := 2;
  arr[3] := 8;
  arr[4] := 1;
  arr[5] := 9;
  arr[6] := 3;

  Gnomesort;

  FOR i := 1 TO N DO
    WRITELN(arr[i]);
END.
