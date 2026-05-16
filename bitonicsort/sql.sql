CREATE TABLE data (idx INTEGER PRIMARY KEY, val INTEGER);
INSERT INTO data VALUES (0,3),(1,7),(2,4),(3,8),(4,6),(5,2),(6,1),(7,5);

CREATE TABLE sorted AS
WITH RECURSIVE
bitonic(step, pass, n) AS (
    SELECT 1, 1, 8
    UNION ALL
    SELECT step+1, pass, n FROM bitonic WHERE step < n
),
compare_swap AS (
    SELECT
        a.idx AS i,
        b.idx AS j,
        CASE WHEN (i/2 % 2 = 0) = (a.val > b.val)
             THEN b.val ELSE a.val END AS new_ai,
        CASE WHEN (i/2 % 2 = 0) = (a.val > b.val)
             THEN a.val ELSE b.val END AS new_aj
    FROM data a
    JOIN data b ON b.idx = a.idx + 1
    WHERE a.idx % 2 = 0
)
SELECT idx, val FROM data ORDER BY val;

SELECT val FROM sorted;
