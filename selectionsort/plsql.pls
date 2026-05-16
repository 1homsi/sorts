CREATE OR REPLACE PROCEDURE selection_sort(arr IN OUT DBMS_SQL.NUMBER_TABLE) IS
    n INTEGER := arr.COUNT;
    min_idx INTEGER;
    tmp NUMBER;
BEGIN
    FOR i IN 1..n-1 LOOP
        min_idx := i;
        FOR j IN i+1..n LOOP
            IF arr(j) < arr(min_idx) THEN
                min_idx := j;
            END IF;
        END LOOP;
        tmp := arr(i);
        arr(i) := arr(min_idx);
        arr(min_idx) := tmp;
    END LOOP;
END;
/
