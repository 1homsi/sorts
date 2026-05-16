CREATE TABLE heap_data (idx INTEGER PRIMARY KEY, val INTEGER);
INSERT INTO heap_data VALUES (0,12),(1,11),(2,13),(3,5),(4,6),(5,7);

CREATE TABLE heap_work AS SELECT * FROM heap_data;

CREATE OR REPLACE PROCEDURE heapify(IN n INT, IN i INT)
LANGUAGE plpgsql AS $$
DECLARE
    largest INT := i;
    left_idx INT := 2 * i + 1;
    right_idx INT := 2 * i + 2;
    vl INT; vr INT; vi INT; vlargest INT; tmp INT;
BEGIN
    SELECT val INTO vi FROM heap_work WHERE idx = i;
    SELECT val INTO vlargest FROM heap_work WHERE idx = largest;
    IF left_idx < n THEN
        SELECT val INTO vl FROM heap_work WHERE idx = left_idx;
        IF vl > vlargest THEN largest := left_idx; SELECT val INTO vlargest FROM heap_work WHERE idx = largest; END IF;
    END IF;
    IF right_idx < n THEN
        SELECT val INTO vr FROM heap_work WHERE idx = right_idx;
        IF vr > vlargest THEN largest := right_idx; END IF;
    END IF;
    IF largest != i THEN
        SELECT val INTO tmp FROM heap_work WHERE idx = i;
        UPDATE heap_work SET val = (SELECT val FROM heap_work WHERE idx = largest) WHERE idx = i;
        UPDATE heap_work SET val = tmp WHERE idx = largest;
        CALL heapify(n, largest);
    END IF;
END;$$;

SELECT val FROM heap_work ORDER BY idx;
