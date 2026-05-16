MODULE Bogosort EXPORTS Main;

IMPORT IO, Random;

VAR
  arr := ARRAY [0..7] OF INTEGER {3, 1, 4, 1, 5, 9, 2, 6};
  n := 8;

PROCEDURE IsSorted(): BOOLEAN =
BEGIN
  FOR i := 0 TO n - 2 DO
    IF arr[i] > arr[i + 1] THEN RETURN FALSE END
  END;
  RETURN TRUE
END IsSorted;

PROCEDURE Shuffle() =
VAR j, tmp: INTEGER; rng := NEW(Random.Default).init();
BEGIN
  FOR i := n - 1 TO 1 BY -1 DO
    j := rng.integer(0, i);
    tmp := arr[i];
    arr[i] := arr[j];
    arr[j] := tmp
  END
END Shuffle;

BEGIN
  WHILE NOT IsSorted() DO Shuffle() END;
  FOR i := 0 TO n - 1 DO
    IO.PutInt(arr[i]); IO.Put(" ")
  END;
  IO.PutChar('\n')
END Bogosort.
