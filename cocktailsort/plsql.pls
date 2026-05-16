CREATE OR REPLACE PROCEDURE cocktail_sort_plsql(
    p_arr IN OUT SYS.ODCINUMBERLIST
) AS
    v_swapped BOOLEAN;
    v_start   PLS_INTEGER;
    v_end     PLS_INTEGER;
    v_tmp     NUMBER;
BEGIN
    v_swapped := TRUE;
    v_start := 1;
    v_end := p_arr.COUNT;
    WHILE v_swapped LOOP
        v_swapped := FALSE;
        FOR i IN v_start..v_end-1 LOOP
            IF p_arr(i) > p_arr(i+1) THEN
                v_tmp := p_arr(i);
                p_arr(i) := p_arr(i+1);
                p_arr(i+1) := v_tmp;
                v_swapped := TRUE;
            END IF;
        END LOOP;
        EXIT WHEN NOT v_swapped;
        v_swapped := FALSE;
        v_end := v_end - 1;
        FOR i IN REVERSE v_start..v_end-1 LOOP
            IF p_arr(i) > p_arr(i+1) THEN
                v_tmp := p_arr(i);
                p_arr(i) := p_arr(i+1);
                p_arr(i+1) := v_tmp;
                v_swapped := TRUE;
            END IF;
        END LOOP;
        v_start := v_start + 1;
    END LOOP;
END;
/
