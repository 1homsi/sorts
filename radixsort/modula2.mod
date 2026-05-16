MODULE RadixSort;
FROM InOut IMPORT WriteInt, WriteLn;

VAR
   arr: ARRAY [0..7] OF INTEGER;
   output: ARRAY [0..7] OF INTEGER;
   count: ARRAY [0..9] OF INTEGER;
   i, n, maxVal, exp, idx: INTEGER;

PROCEDURE CountingSort(VAR a: ARRAY OF INTEGER; e: INTEGER);
VAR j, k, d: INTEGER;
BEGIN
   FOR j := 0 TO 9 DO count[j] := 0 END;
   FOR j := 0 TO 7 DO
      d := (a[j] DIV e) MOD 10;
      INC(count[d])
   END;
   FOR j := 1 TO 9 DO count[j] := count[j] + count[j-1] END;
   FOR j := 7 TO 0 BY -1 DO
      d := (a[j] DIV e) MOD 10;
      DEC(count[d]);
      output[count[d]] := a[j]
   END;
   FOR j := 0 TO 7 DO a[j] := output[j] END
END CountingSort;

BEGIN
   arr[0] := 170; arr[1] := 45; arr[2] := 75; arr[3] := 90;
   arr[4] := 802; arr[5] := 24; arr[6] := 2;  arr[7] := 66;
   maxVal := arr[0];
   FOR i := 1 TO 7 DO
      IF arr[i] > maxVal THEN maxVal := arr[i] END
   END;
   exp := 1;
   WHILE maxVal DIV exp > 0 DO
      CountingSort(arr, exp);
      exp := exp * 10
   END;
   FOR i := 0 TO 7 DO WriteInt(arr[i], 5) END;
   WriteLn
END RadixSort.
