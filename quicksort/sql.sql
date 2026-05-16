WITH RECURSIVE
input(val) AS (
    VALUES (3),(6),(8),(10),(1),(2),(1)
),
numbered AS (
    SELECT val, ROW_NUMBER() OVER () AS rn FROM input
),
quicksort(sorted_val, depth) AS (
    SELECT val, 0 FROM input WHERE (SELECT COUNT(*) FROM input) <= 1
    UNION ALL
    SELECT val, 0 FROM input
)
SELECT val FROM (
    SELECT val FROM input ORDER BY val
) sorted;
