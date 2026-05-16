MODULE CountingSort EXPORTS Main;
IMPORT IO, Fmt;

PROCEDURE Sort(VAR arr: ARRAY OF INTEGER) =
VAR
  n := NUMBER(arr);
  mn, mx, rng: INTEGER;
  count: REF ARRAY OF INTEGER;
  output: REF ARRAY OF INTEGER;
BEGIN
  IF n = 0 THEN RETURN END;
  mn := arr[0]; mx := arr[0];
  FOR i := 0 TO n - 1 DO
    IF arr[i] < mn THEN mn := arr[i] END;
    IF arr[i] > mx THEN mx := arr[i] END;
  END;
  rng := mx - mn + 1;
  count := NEW(REF ARRAY OF INTEGER, rng);
  output := NEW(REF ARRAY OF INTEGER, n);
  FOR i := 0 TO rng - 1 DO count[i] := 0 END;
  FOR i := 0 TO n - 1 DO INC(count[arr[i] - mn]) END;
  FOR i := 1 TO rng - 1 DO count[i] := count[i] + count[i-1] END;
  FOR i := n - 1 TO 0 BY -1 DO
    DEC(count[arr[i] - mn]);
    output[count[arr[i] - mn]] := arr[i];
  END;
  FOR i := 0 TO n - 1 DO arr[i] := output[i] END;
END Sort;

VAR data := ARRAY [0..6] OF INTEGER {4, 2, 2, 8, 3, 3, 1};
BEGIN
  Sort(data);
  FOR i := 0 TO 6 DO IO.Put(Fmt.Int(data[i]) & " ") END;
  IO.Put("
");
END CountingSort.
