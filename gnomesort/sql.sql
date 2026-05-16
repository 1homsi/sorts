CREATE TABLE sort_array (pos INT, val INT);

INSERT INTO sort_array VALUES (1,5),(2,3),(3,8),(4,1),(5,9),(6,2),(7,7),(8,4),(9,6),(10,0);

WITH RECURSIVE gnome(pos, val, i, n, arr) AS (
    SELECT pos, val, 1, COUNT(*) OVER (), ARRAY_AGG(val ORDER BY pos) OVER ()
    FROM sort_array
    LIMIT 1
    UNION ALL
    SELECT pos, val, i+1, n, arr
    FROM gnome
    WHERE i <= n
)
SELECT * FROM gnome ORDER BY pos;
