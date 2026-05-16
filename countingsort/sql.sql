CREATE TABLE arr_data (id INTEGER, val INTEGER);
INSERT INTO arr_data VALUES (1,4),(2,2),(3,2),(4,8),(5,3),(6,3),(7,1);

WITH min_max AS (
    SELECT MIN(val) AS mn, MAX(val) AS mx FROM arr_data
),
val_series AS (
    SELECT DISTINCT val AS v FROM arr_data ORDER BY val
),
counted AS (
    SELECT v, COUNT(*) AS cnt
    FROM val_series
    JOIN arr_data ON arr_data.val = val_series.v
    GROUP BY v
),
expanded AS (
    SELECT v, ROW_NUMBER() OVER (ORDER BY v) AS pos
    FROM (
        SELECT val_series.v
        FROM val_series
        JOIN counted ON counted.v = val_series.v
        JOIN (SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3
              UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6
              UNION ALL SELECT 7) nums ON nums.n <= counted.cnt
        ORDER BY val_series.v
    ) t
)
SELECT v AS sorted_val FROM expanded ORDER BY pos;
