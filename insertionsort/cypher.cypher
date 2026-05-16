WITH [5, 3, 1, 4, 2] AS arr
UNWIND arr AS val
WITH val ORDER BY val
RETURN collect(val) AS sorted
