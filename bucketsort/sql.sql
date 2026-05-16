CREATE TABLE IF NOT EXISTS arr (id INTEGER PRIMARY KEY, val REAL);
INSERT INTO arr VALUES (1, 0.78), (2, 0.17), (3, 0.39), (4, 0.26), (5, 0.72),
                       (6, 0.94), (7, 0.21), (8, 0.12), (9, 0.23), (10, 0.68);

WITH RECURSIVE
  stats AS (
    SELECT MIN(val) AS min_v, MAX(val) AS max_v, COUNT(*) AS n FROM arr
  ),
  bucketed AS (
    SELECT
      a.val,
      MIN(CAST((a.val - s.min_v) / (s.max_v - s.min_v + 1) * s.n AS INTEGER), s.n - 1) AS bucket_idx
    FROM arr a, stats s
  ),
  bucket_sorted AS (
    SELECT
      b1.val,
      b1.bucket_idx,
      COUNT(b2.val) AS rank_in_bucket
    FROM bucketed b1
    LEFT JOIN bucketed b2
      ON b1.bucket_idx = b2.bucket_idx AND (b2.val < b1.val OR (b2.val = b1.val AND b2.rowid < b1.rowid))
    GROUP BY b1.rowid
  )
SELECT val
FROM bucket_sorted
ORDER BY bucket_idx, rank_in_bucket;
