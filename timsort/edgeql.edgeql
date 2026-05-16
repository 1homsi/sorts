WITH
    input_vals := array_unpack([5, 2, 8, 1, 9, 3, 7, 4, 6]),
    sorted := (
        SELECT input_vals
        ORDER BY input_vals
    )
SELECT array_agg(sorted);
