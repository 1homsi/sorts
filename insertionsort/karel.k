PROGRAM insertionsort

BEGIN
  ARRAY arr(6) = (5, 2, 8, 1, 9, 3);
  FOR i := 2 TO 6 DO
    key := arr[i];
    j := i - 1;
    WHILE j >= 1 AND arr[j] > key DO
      arr[j + 1] := arr[j];
      j := j - 1;
    END;
    arr[j + 1] := key;
  END;
  OUTPUT arr
END.