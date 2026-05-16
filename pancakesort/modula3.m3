MODULE PancakeSort EXPORTS Main;

IMPORT IO, Fmt;

VAR arr := ARRAY [0..6] OF INTEGER {3, 6, 2, 7, 4, 1, 5};

PROCEDURE Flip(k: INTEGER) =
  VAR left, right, tmp: INTEGER;
  BEGIN
    left := 0; right := k;
    WHILE left < right DO
      tmp := arr[left]; arr[left] := arr[right]; arr[right] := tmp;
      INC(left); DEC(right)
    END
  END Flip;

PROCEDURE FindMaxIdx(size: INTEGER): INTEGER =
  VAR maxIdx: INTEGER := 0;
  BEGIN
    FOR i := 1 TO size - 1 DO
      IF arr[i] > arr[maxIdx] THEN maxIdx := i END
    END;
    RETURN maxIdx
  END FindMaxIdx;

PROCEDURE PancakeSort() =
  VAR size: INTEGER := 7; maxIdx: INTEGER;
  BEGIN
    WHILE size > 1 DO
      maxIdx := FindMaxIdx(size);
      IF maxIdx # size - 1 THEN
        IF maxIdx # 0 THEN Flip(maxIdx) END;
        Flip(size - 1)
      END;
      DEC(size)
    END
  END PancakeSort;

BEGIN
  PancakeSort();
  FOR i := 0 TO 6 DO
    IO.Put(Fmt.Int(arr[i]) & " ")
  END;
  IO.Put("\n")
END PancakeSort.
