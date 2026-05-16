WITH
    arr := [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68],
    n := len(arr),
    min_v := min(array_unpack(arr)),
    max_v := max(array_unpack(arr)),
    bucketed := (
        FOR val IN array_unpack(arr)
        UNION (
            SELECT {
                val := val,
                bucket_idx := math::floor((val - min_v) / (max_v - min_v + 1) * <float64>n)
            }
        )
    )
SELECT bucketed.val
ORDER BY bucketed.bucket_idx ASC THEN bucketed.val ASC;
