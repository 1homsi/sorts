MODULE BucketSort;

FROM InOut IMPORT WriteReal, WriteLn;

CONST N = 10;

TYPE FloatArray = ARRAY [1..N] OF REAL;
     BucketArr = ARRAY [1..N] OF REAL;
     BucketMatrix = ARRAY [1..N] OF BucketArr;
     CountArr = ARRAY [1..N] OF INTEGER;

PROCEDURE InsertionSort(VAR bucket: BucketArr; n: INTEGER);
VAR i, j: INTEGER;
    key: REAL;
BEGIN
    FOR i := 2 TO n DO
        key := bucket[i];
        j := i - 1;
        WHILE (j >= 1) AND (bucket[j] > key) DO
            bucket[j + 1] := bucket[j];
            DEC(j)
        END;
        bucket[j + 1] := key
    END
END InsertionSort;

PROCEDURE BucketSort(VAR arr: FloatArray);
VAR minV, maxV, num: REAL;
    i, idx, b, pos: INTEGER;
    buckets: BucketMatrix;
    counts: CountArr;
BEGIN
    minV := arr[1]; maxV := arr[1];
    FOR i := 1 TO N DO
        IF arr[i] < minV THEN minV := arr[i] END;
        IF arr[i] > maxV THEN maxV := arr[i] END
    END;
    FOR i := 1 TO N DO counts[i] := 0 END;
    FOR i := 1 TO N DO
        num := arr[i];
        idx := TRUNC((num - minV) / (maxV - minV + 1.0) * FLOAT(N)) + 1;
        IF idx > N THEN idx := N END;
        INC(counts[idx]);
        buckets[idx][counts[idx]] := num
    END;
    pos := 1;
    FOR b := 1 TO N DO
        InsertionSort(buckets[b], counts[b]);
        FOR i := 1 TO counts[b] DO
            arr[pos] := buckets[b][i];
            INC(pos)
        END
    END
END BucketSort;

VAR data: FloatArray;
    i: INTEGER;
BEGIN
    data[1] := 0.78; data[2] := 0.17; data[3] := 0.39; data[4] := 0.26; data[5] := 0.72;
    data[6] := 0.94; data[7] := 0.21; data[8] := 0.12; data[9] := 0.23; data[10] := 0.68;
    BucketSort(data);
    FOR i := 1 TO N DO
        WriteReal(data[i], 6); WriteLn
    END
END BucketSort.
