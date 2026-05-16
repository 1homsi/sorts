CREATE TABLE arr (idx INTEGER, val INTEGER);
INSERT INTO arr VALUES (0,3),(1,6),(2,2),(3,7),(4,4),(5,1),(6,5);

CREATE OR REPLACE PROCEDURE pancake_sort() AS $$
DECLARE
    n INTEGER := 7;
    size INTEGER;
    max_idx INTEGER;
    i INTEGER;
    tmp INTEGER;
    left_i INTEGER;
    right_i INTEGER;
BEGIN
    FOR size IN REVERSE n..2 LOOP
        SELECT idx INTO max_idx FROM arr WHERE idx < size ORDER BY val DESC LIMIT 1;
        IF max_idx != size - 1 THEN
            IF max_idx != 0 THEN
                left_i := 0; right_i := max_idx;
                WHILE left_i < right_i LOOP
                    SELECT val INTO tmp FROM arr WHERE idx = left_i;
                    UPDATE arr SET val = (SELECT val FROM arr WHERE idx = right_i) WHERE idx = left_i;
                    UPDATE arr SET val = tmp WHERE idx = right_i;
                    left_i := left_i + 1; right_i := right_i - 1;
                END LOOP;
            END IF;
            left_i := 0; right_i := size - 1;
            WHILE left_i < right_i LOOP
                SELECT val INTO tmp FROM arr WHERE idx = left_i;
                UPDATE arr SET val = (SELECT val FROM arr WHERE idx = right_i) WHERE idx = left_i;
                UPDATE arr SET val = tmp WHERE idx = right_i;
                left_i := left_i + 1; right_i := right_i - 1;
            END LOOP;
        END IF;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

CALL pancake_sort();
SELECT val FROM arr ORDER BY idx;
