MODULE CombSort EXPORTS Main;

IMPORT IO;

VAR
  arr := ARRAY [0..9] OF INTEGER {5, 2, 8, 1, 9, 3, 7, 4, 6, 0};

PROCEDURE Sort(VAR a: ARRAY OF INTEGER) =
  VAR
    n   := NUMBER(a);
    gap := n;
    sorted := FALSE;
    tmp: INTEGER;
  BEGIN
    WHILE NOT sorted DO
      gap := ROUND(FLOAT(gap) / 1.3);
      IF gap <= 1 THEN gap := 1; sorted := TRUE END;
      FOR i := 0 TO n - gap - 1 DO
        IF a[i] > a[i + gap] THEN
          tmp := a[i];
          a[i] := a[i + gap];
          a[i + gap] := tmp;
          sorted := FALSE;
        END;
      END;
    END;
  END Sort;

BEGIN
  Sort(arr);
END CombSort.
