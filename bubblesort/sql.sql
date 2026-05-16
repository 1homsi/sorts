CREATE TABLE nums (pos INT, val INT);
INSERT INTO nums VALUES (1,64),(2,34),(3,25),(4,12),(5,22),(6,11),(7,90);

CREATE OR REPLACE PROCEDURE bubble_sort() AS $$
DECLARE
    n INT := 7;
    swapped BOOLEAN;
    tmp INT;
    v1 INT; v2 INT;
BEGIN
    LOOP
        swapped := FALSE;
        FOR i IN 1..n-1 LOOP
            SELECT val INTO v1 FROM nums WHERE pos = i;
            SELECT val INTO v2 FROM nums WHERE pos = i+1;
            IF v1 > v2 THEN
                UPDATE nums SET val = v2 WHERE pos = i;
                UPDATE nums SET val = v1 WHERE pos = i+1;
                swapped := TRUE;
            END IF;
        END LOOP;
        n := n - 1;
        EXIT WHEN NOT swapped;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

CALL bubble_sort();
SELECT val FROM nums ORDER BY pos;
