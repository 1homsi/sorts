WITH [5, 3, 8, 1, 9, 2, 7, 4, 6] AS arr
WITH arr, size(arr) AS n, size(arr) AS gap, false AS sorted
WITH arr, n, gap, sorted,
     toInteger(gap / 1.3) AS newGap
WITH arr, n,
     CASE WHEN newGap < 1 THEN 1 ELSE newGap END AS gap,
     CASE WHEN newGap <= 1 THEN true ELSE false END AS sorted
RETURN arr, gap, sorted
