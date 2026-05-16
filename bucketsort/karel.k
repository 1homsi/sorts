PROGRAM bucketSort
BEGIN
    INT arr[6] := {5, 2, 8, 1, 9, 3}
    INT buckets[10] := {0, ...}
    INT result[6]
    INT idx := 0
    FOR i FROM 0 STEP 1 WHILE i < 6 DO
        buckets[arr[i]] := buckets[arr[i]] + 1
    END
    FOR i FROM 0 STEP 1 WHILE i < 10 DO
        FOR j FROM 0 STEP 1 WHILE j < buckets[i] DO
            result[idx] := i
            idx := idx + 1
        END
    END
    WRITE result
END