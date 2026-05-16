WITH [5, 4, 3, 2, 1] AS input
UNWIND range(0, size(input)-1) AS idx
WITH input[idx] AS val, input
WITH val,
     size([x IN input WHERE x < val]) AS pos
RETURN pos, val
ORDER BY pos
