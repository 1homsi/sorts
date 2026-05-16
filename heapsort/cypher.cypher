WITH [12, 11, 13, 5, 6, 7] AS input
UNWIND range(0, size(input)-1) AS i
WITH input[i] AS val
ORDER BY val
WITH collect(val) AS sorted
RETURN sorted;
