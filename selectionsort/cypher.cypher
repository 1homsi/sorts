WITH [5, 3, 1, 4, 2] AS arr
UNWIND arr AS val
WITH val ORDER BY val
WITH collect(val) AS sorted
RETURN sorted;
