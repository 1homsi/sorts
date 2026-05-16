WITH RECURSIVE
  input(pos, val) AS (
    VALUES (1,5),(2,3),(3,1),(4,4),(5,2)
  ),
  selection_sort(step, pos, val, arr) AS (
    SELECT 0, pos, val, (SELECT GROUP_CONCAT(val ORDER BY pos) FROM input)
    FROM input
    UNION ALL
    SELECT step+1, pos, val, arr FROM selection_sort WHERE step < 5
  )
SELECT pos, val FROM input ORDER BY val;
