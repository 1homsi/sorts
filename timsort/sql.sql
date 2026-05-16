CREATE TABLE IF NOT EXISTS sort_input (id INTEGER PRIMARY KEY, val INTEGER);
CREATE TABLE IF NOT EXISTS sort_output (id INTEGER PRIMARY KEY, val INTEGER);

INSERT INTO sort_input (val) VALUES (5),(2),(8),(1),(9),(3),(7),(4),(6);

WITH RECURSIVE
runs AS (
    SELECT
        id,
        val,
        ((id - 1) / 32) AS run_id
    FROM sort_input
),
isorted_runs AS (
    SELECT
        r1.id,
        r1.val,
        r1.run_id,
        COUNT(*) AS pos_in_run
    FROM runs r1
    JOIN runs r2 ON r1.run_id = r2.run_id AND r2.val <= r1.val
    GROUP BY r1.id, r1.val, r1.run_id
),
ranked AS (
    SELECT
        val,
        ROW_NUMBER() OVER (ORDER BY run_id, pos_in_run) AS rn
    FROM isorted_runs
)
SELECT val FROM ranked ORDER BY rn;
