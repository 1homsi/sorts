CREATE TABLE nums (pos INT, val INT);

WITH RECURSIVE sorted AS (
    SELECT pos, val,
           ROW_NUMBER() OVER (ORDER BY val) AS rank
    FROM nums
)
SELECT rank AS pos, val
FROM sorted
ORDER BY rank;
