CREATE TABLE arr_data (idx INT, val INT);
INSERT INTO arr_data VALUES (0,5),(1,4),(2,3),(3,2),(4,1);

WITH RECURSIVE
sorted AS (
    SELECT idx, val,
           ROW_NUMBER() OVER (ORDER BY val) - 1 AS new_idx
    FROM arr_data
)
SELECT s.new_idx AS position, s.val
FROM sorted s
ORDER BY s.new_idx;
