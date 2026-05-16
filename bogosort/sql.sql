CREATE TABLE arr (pos INTEGER PRIMARY KEY, val INTEGER);
INSERT INTO arr VALUES (1,3),(2,1),(3,4),(4,1),(5,5),(6,9),(7,2),(8,6);

CREATE TABLE is_sorted_check AS
SELECT COUNT(*) = 0 AS sorted
FROM arr a1
JOIN arr a2 ON a2.pos = a1.pos + 1
WHERE a1.val > a2.val;

SELECT val FROM arr ORDER BY val;
