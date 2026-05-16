MODULE BucketSort EXPORTS Main;

IMPORT IO, Fmt;

CONST N = 10;

TYPE FloatArr = ARRAY OF REAL;

PROCEDURE InsertionSort(VAR bucket: FloatArr; n: INTEGER) =
  VAR key: REAL; j: INTEGER;
  BEGIN
    FOR i := 1 TO n - 1 DO
      key := bucket[i];
      j := i - 1;
      WHILE j >= 0 AND bucket[j] > key DO
        bucket[j + 1] := bucket[j];
        DEC(j)
      END;
      bucket[j + 1] := key
    END
  END InsertionSort;

PROCEDURE BucketSort(VAR arr: FloatArr) =
  VAR minV, maxV, num: REAL;
      idx, pos: INTEGER;
      buckets: ARRAY [0..N-1] OF ARRAY [0..N-1] OF REAL;
      counts: ARRAY [0..N-1] OF INTEGER;
  BEGIN
    minV := arr[0]; maxV := arr[0];
    FOR i := 0 TO N - 1 DO
      IF arr[i] < minV THEN minV := arr[i] END;
      IF arr[i] > maxV THEN maxV := arr[i] END
    END;
    FOR i := 0 TO N - 1 DO counts[i] := 0 END;
    FOR i := 0 TO N - 1 DO
      num := arr[i];
      idx := TRUNC((num - minV) / (maxV - minV + 1.0) * FLOAT(N));
      IF idx >= N THEN idx := N - 1 END;
      buckets[idx][counts[idx]] := num;
      INC(counts[idx])
    END;
    pos := 0;
    FOR b := 0 TO N - 1 DO
      InsertionSort(buckets[b], counts[b]);
      FOR i := 0 TO counts[b] - 1 DO
        arr[pos] := buckets[b][i];
        INC(pos)
      END
    END
  END BucketSort;

VAR data: ARRAY [0..N-1] OF REAL :=
  ARRAY OF REAL{0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68};

BEGIN
  BucketSort(data);
  FOR i := 0 TO N - 1 DO
    IO.Put(Fmt.Real(data[i]) & " ")
  END;
  IO.Put("\n")
END BucketSort.
