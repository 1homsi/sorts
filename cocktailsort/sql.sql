CREATE TABLE sort_data (id INTEGER PRIMARY KEY, val INTEGER);

CREATE OR REPLACE PROCEDURE cocktail_sort() AS $$
DECLARE
    swapped BOOLEAN;
    start_idx INTEGER;
    end_idx INTEGER;
    n INTEGER;
    a INTEGER;
    b INTEGER;
BEGIN
    SELECT COUNT(*) INTO n FROM sort_data;
    swapped := TRUE;
    start_idx := 1;
    end_idx := n;
    WHILE swapped LOOP
        swapped := FALSE;
        FOR i IN start_idx..end_idx-1 LOOP
            SELECT val INTO a FROM sort_data WHERE id = i;
            SELECT val INTO b FROM sort_data WHERE id = i + 1;
            IF a > b THEN
                UPDATE sort_data SET val = b WHERE id = i;
                UPDATE sort_data SET val = a WHERE id = i + 1;
                swapped := TRUE;
            END IF;
        END LOOP;
        EXIT WHEN NOT swapped;
        swapped := FALSE;
        end_idx := end_idx - 1;
        FOR i IN REVERSE end_idx-1..start_idx LOOP
            SELECT val INTO a FROM sort_data WHERE id = i;
            SELECT val INTO b FROM sort_data WHERE id = i + 1;
            IF a > b THEN
                UPDATE sort_data SET val = b WHERE id = i;
                UPDATE sort_data SET val = a WHERE id = i + 1;
                swapped := TRUE;
            END IF;
        END LOOP;
        start_idx := start_idx + 1;
    END LOOP;
END;
$$ LANGUAGE plpgsql;
