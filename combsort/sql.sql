CREATE TABLE sort_data (idx INTEGER PRIMARY KEY, val INTEGER);

CREATE OR REPLACE PROCEDURE comb_sort() AS $$
DECLARE
    n INTEGER;
    gap INTEGER;
    sorted BOOLEAN;
    tmp INTEGER;
    a_val INTEGER;
    b_val INTEGER;
BEGIN
    SELECT COUNT(*) INTO n FROM sort_data;
    gap := n;
    sorted := FALSE;
    WHILE NOT sorted LOOP
        gap := GREATEST(1, FLOOR(gap / 1.3)::INTEGER);
        IF gap = 1 THEN sorted := TRUE; END IF;
        FOR i IN 1..(n - gap) LOOP
            SELECT val INTO a_val FROM sort_data WHERE idx = i;
            SELECT val INTO b_val FROM sort_data WHERE idx = i + gap;
            IF a_val > b_val THEN
                UPDATE sort_data SET val = b_val WHERE idx = i;
                UPDATE sort_data SET val = a_val WHERE idx = i + gap;
                sorted := FALSE;
            END IF;
        END LOOP;
    END LOOP;
END;
$$ LANGUAGE plpgsql;
