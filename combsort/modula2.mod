MODULE CombSort;

FROM SYSTEM IMPORT TSIZE;
FROM InOut IMPORT WriteInt, WriteLn;

CONST MaxSize = 100;

VAR
  Arr : ARRAY [1..MaxSize] OF INTEGER;
  N, Gap, I, Tmp : INTEGER;
  Sorted : BOOLEAN;

PROCEDURE Sort;
BEGIN
  Gap := N;
  Sorted := FALSE;
  WHILE NOT Sorted DO
    Gap := TRUNC(FLOAT(Gap) / 1.3);
    IF Gap < 1 THEN Gap := 1 END;
    IF Gap = 1 THEN Sorted := TRUE END;
    FOR I := 1 TO N - Gap DO
      IF Arr[I] > Arr[I + Gap] THEN
        Tmp := Arr[I];
        Arr[I] := Arr[I + Gap];
        Arr[I + Gap] := Tmp;
        Sorted := FALSE;
      END;
    END;
  END;
END Sort;

BEGIN
END CombSort.
