CREATE TABLE numbers (id SERIAL PRIMARY KEY, val INTEGER);
INSERT INTO numbers (val) VALUES (170), (45), (75), (90), (802), (24), (2), (66);

WITH RECURSIVE
params AS (
    SELECT MAX(val) AS max_val FROM numbers
),
exp_series AS (
    SELECT 1 AS exp
    UNION ALL
    SELECT exp * 10
    FROM exp_series, params
    WHERE (max_val / exp) > 0
),
radix_pass AS (
    SELECT val,
           ROW_NUMBER() OVER (
               PARTITION BY (val / e.exp) % 10
               ORDER BY id
           ) AS bucket_pos,
           (val / e.exp) % 10 AS digit
    FROM numbers
    CROSS JOIN (SELECT MAX(exp) as exp FROM exp_series) e
)
SELECT val
FROM radix_pass
ORDER BY digit, bucket_pos;
