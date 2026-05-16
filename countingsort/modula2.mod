MODULE CountingSort;
FROM InOut IMPORT WriteInt, WriteLn;

PROCEDURE Sort(VAR arr: ARRAY OF INTEGER; n: INTEGER);
VAR
  count: ARRAY [0..255] OF INTEGER;
  output: ARRAY [0..6] OF INTEGER;
  i, mn, mx, rng, idx: INTEGER;
BEGIN
  mn := arr[0]; mx := arr[0];
  FOR i := 0 TO n - 1 DO
    IF arr[i] < mn THEN mn := arr[i] END;
    IF arr[i] > mx THEN mx := arr[i] END;
  END;
  rng := mx - mn + 1;
  FOR i := 0 TO rng - 1 DO count[i] := 0 END;
  FOR i := 0 TO n - 1 DO INC(count[arr[i] - mn]) END;
  FOR i := 1 TO rng - 1 DO count[i] := count[i] + count[i - 1] END;
  FOR i := n - 1 TO 0 BY -1 DO
    DEC(count[arr[i] - mn]);
    output[count[arr[i] - mn]] := arr[i];
  END;
  FOR i := 0 TO n - 1 DO arr[i] := output[i] END;
END Sort;

VAR data: ARRAY [0..6] OF INTEGER;
    i: INTEGER;
BEGIN
  data[0] := 4; data[1] := 2; data[2] := 2; data[3] := 8;
  data[4] := 3; data[5] := 3; data[6] := 1;
  Sort(data, 7);
  FOR i := 0 TO 6 DO WriteInt(data[i], 4) END;
  WriteLn;
END CountingSort.
