MODULE RadixSort EXPORTS Main;
IMPORT IO, Fmt;

VAR arr: ARRAY [0..7] OF INTEGER = ARRAY OF INTEGER{170,45,75,90,802,24,2,66};

PROCEDURE CountingSort(VAR a: ARRAY OF INTEGER; exp: INTEGER) =
  VAR n := NUMBER(a);
      output: ARRAY [0..7] OF INTEGER;
      count: ARRAY [0..9] OF INTEGER;
      idx: INTEGER;
  BEGIN
    FOR i := 0 TO 9 DO count[i] := 0 END;
    FOR i := 0 TO n-1 DO
      idx := (a[i] DIV exp) MOD 10;
      INC(count[idx])
    END;
    FOR i := 1 TO 9 DO count[i] := count[i] + count[i-1] END;
    FOR i := n-1 TO 0 BY -1 DO
      idx := (a[i] DIV exp) MOD 10;
      DEC(count[idx]);
      output[count[idx]] := a[i]
    END;
    FOR i := 0 TO n-1 DO a[i] := output[i] END
  END CountingSort;

PROCEDURE RadixSort(VAR a: ARRAY OF INTEGER) =
  VAR maxVal := a[0]; exp := 1;
  BEGIN
    FOR i := 1 TO LAST(a) DO IF a[i] > maxVal THEN maxVal := a[i] END END;
    WHILE maxVal DIV exp > 0 DO
      CountingSort(a, exp);
      exp := exp * 10
    END
  END RadixSort;

BEGIN
  RadixSort(arr);
  FOR i := 0 TO 7 DO IO.Put(Fmt.Int(arr[i]) & " ") END;
  IO.Put("\n")
END RadixSort.
