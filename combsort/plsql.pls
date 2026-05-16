CREATE OR REPLACE PROCEDURE comb_sort (
    p_arr IN OUT DBMS_SQL.NUMBER_TABLE
) AS
    v_n      PLS_INTEGER;
    v_gap    PLS_INTEGER;
    v_sorted BOOLEAN;
    v_tmp    NUMBER;
BEGIN
    v_n := p_arr.COUNT;
    v_gap := v_n;
    v_sorted := FALSE;
    WHILE NOT v_sorted LOOP
        v_gap := GREATEST(1, TRUNC(v_gap / 1.3));
        IF v_gap = 1 THEN v_sorted := TRUE; END IF;
        FOR i IN 1 .. v_n - v_gap LOOP
            IF p_arr(i) > p_arr(i + v_gap) THEN
                v_tmp := p_arr(i);
                p_arr(i) := p_arr(i + v_gap);
                p_arr(i + v_gap) := v_tmp;
                v_sorted := FALSE;
            END IF;
        END LOOP;
    END LOOP;
END comb_sort;
