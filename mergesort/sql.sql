WITH RECURSIVE
input_data(id, val) AS (
    VALUES (1,38),(2,27),(3,43),(4,3),(5,9),(6,82),(7,10)
),
merge_sort(lo, hi, depth, sorted_vals) AS (
    SELECT id, id, 0, ARRAY[val]
    FROM input_data
    UNION ALL
    SELECT a.lo, b.hi, a.depth + 1,
        (SELECT ARRAY_AGG(v ORDER BY v)
         FROM UNNEST(a.sorted_vals || b.sorted_vals) AS v)
    FROM merge_sort a
    JOIN merge_sort b ON a.hi + 1 = b.lo AND a.depth = b.depth
    WHERE a.depth < 3
)
SELECT unnest(sorted_vals) AS sorted_value
FROM merge_sort
WHERE lo = 1 AND hi = 7
ORDER BY sorted_value;
