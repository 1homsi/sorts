MODULE Bogosort;
IMPORT Out, Random;

VAR arr: ARRAY 8 OF INTEGER;
    n, i, j, tmp: INTEGER;

PROCEDURE IsSorted(): BOOLEAN;
VAR k: INTEGER;
BEGIN
  FOR k := 0 TO n - 2 DO
    IF arr[k] > arr[k + 1] THEN RETURN FALSE END
  END;
  RETURN TRUE
END IsSorted;

PROCEDURE Shuffle();
VAR k, r, t: INTEGER;
BEGIN
  FOR k := n - 1 TO 1 BY -1 DO
    r := Random.Int(k + 1);
    t := arr[k];
    arr[k] := arr[r];
    arr[r] := t
  END
END Shuffle;

BEGIN
  n := 8;
  arr[0] := 3; arr[1] := 1; arr[2] := 4; arr[3] := 1;
  arr[4] := 5; arr[5] := 9; arr[6] := 2; arr[7] := 6;

  WHILE ~IsSorted() DO Shuffle() END;

  FOR i := 0 TO n - 1 DO
    Out.Int(arr[i], 4)
  END;
  Out.Ln
END Bogosort.
