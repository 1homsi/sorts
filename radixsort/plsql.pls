DECLARE
    TYPE int_arr IS TABLE OF INTEGER INDEX BY PLS_INTEGER;
    arr int_arr;
    output int_arr;
    count_arr int_arr;
    n INTEGER := 8;
    max_val INTEGER;
    exp INTEGER;
    idx INTEGER;

    PROCEDURE counting_sort(p_exp INTEGER) IS
    BEGIN
        FOR i IN 0..9 LOOP count_arr(i) := 0; END LOOP;
        FOR i IN 1..n LOOP
            idx := MOD(TRUNC(arr(i) / p_exp), 10);
            count_arr(idx) := count_arr(idx) + 1;
        END LOOP;
        FOR i IN 1..9 LOOP
            count_arr(i) := count_arr(i) + count_arr(i-1);
        END LOOP;
        FOR i IN REVERSE 1..n LOOP
            idx := MOD(TRUNC(arr(i) / p_exp), 10);
            output(count_arr(idx)) := arr(i);
            count_arr(idx) := count_arr(idx) - 1;
        END LOOP;
        FOR i IN 1..n LOOP arr(i) := output(i); END LOOP;
    END;

BEGIN
    arr(1) := 170; arr(2) := 45; arr(3) := 75; arr(4) := 90;
    arr(5) := 802; arr(6) := 24; arr(7) := 2;  arr(8) := 66;
    max_val := arr(1);
    FOR i IN 2..n LOOP
        IF arr(i) > max_val THEN max_val := arr(i); END IF;
    END LOOP;
    exp := 1;
    WHILE TRUNC(max_val / exp) > 0 LOOP
        counting_sort(exp);
        exp := exp * 10;
    END LOOP;
    FOR i IN 1..n LOOP
        DBMS_OUTPUT.PUT(arr(i) || ' ');
    END LOOP;
    DBMS_OUTPUT.NEW_LINE;
END;
/
