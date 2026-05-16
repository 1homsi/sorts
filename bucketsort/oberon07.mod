MODULE BucketSort;
  PROCEDURE Sort(VAR arr: ARRAY OF INTEGER; maxVal: INTEGER);
    VAR buckets: ARRAY 10 OF INTEGER;
    VAR result: ARRAY 6 OF INTEGER;
    VAR i, idx: INTEGER;
  BEGIN
    FOR i := 0 TO maxVal - 1 DO
      buckets[i] := 0;
    END;
    FOR i := 0 TO 5 DO
      buckets[arr[i]] := arr[i];
    END;
    idx := 0;
    FOR i := 0 TO maxVal - 1 DO
      IF buckets[i] > 0 THEN
        result[idx] := buckets[i];
        INC(idx);
      END;
    END;
  END Sort;
END BucketSort.