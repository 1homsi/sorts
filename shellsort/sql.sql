CREATE TABLE arr_data (idx INTEGER, val INTEGER);
INSERT INTO arr_data VALUES (0,64),(1,34),(2,25),(3,12),(4,22),(5,11),(6,90);

CREATE TABLE sorted AS
WITH RECURSIVE
input AS (SELECT idx, val FROM arr_data),
shell AS (
    SELECT val, ROW_NUMBER() OVER (ORDER BY val) - 1 AS idx
    FROM input
)
SELECT idx, val FROM shell ORDER BY idx;

SELECT val FROM sorted ORDER BY idx;
