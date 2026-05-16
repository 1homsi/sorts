CREATE TABLE arr_table (idx INTEGER PRIMARY KEY, val INTEGER);
INSERT INTO arr_table VALUES (0,3),(1,1),(2,4),(3,1),(4,5),(5,9),(6,2),(7,6);

CREATE OR REPLACE PROCEDURE stooge_sort(first INT, last INT)
LANGUAGE plpgsql AS $$
DECLARE
    a INTEGER; b INTEGER; tmp INTEGER; t INTEGER; n INTEGER;
BEGIN
    SELECT val INTO a FROM arr_table WHERE idx = first;
    SELECT val INTO b FROM arr_table WHERE idx = last;
    IF a > b THEN
        UPDATE arr_table SET val = b WHERE idx = first;
        UPDATE arr_table SET val = a WHERE idx = last;
    END IF;
    n := last - first + 1;
    IF n > 2 THEN
        t := n * 2 / 3;
        CALL stooge_sort(first, first + t - 1);
        CALL stooge_sort(last - t + 1, last);
        CALL stooge_sort(first, first + t - 1);
    END IF;
END;
$$;

CALL stooge_sort(0, 7);
SELECT val FROM arr_table ORDER BY idx;
