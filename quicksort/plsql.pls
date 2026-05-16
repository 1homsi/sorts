CREATE OR REPLACE PROCEDURE quicksort_demo IS
    TYPE int_arr IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    arr int_arr;
    n   PLS_INTEGER := 7;

    FUNCTION partition(p_arr IN OUT int_arr, p_low IN PLS_INTEGER, p_high IN PLS_INTEGER) RETURN PLS_INTEGER IS
        pivot NUMBER;
        i     PLS_INTEGER;
        tmp   NUMBER;
    BEGIN
        pivot := p_arr(p_high);
        i := p_low;
        FOR j IN p_low .. p_high - 1 LOOP
            IF p_arr(j) <= pivot THEN
                tmp := p_arr(i); p_arr(i) := p_arr(j); p_arr(j) := tmp;
                i := i + 1;
            END IF;
        END LOOP;
        tmp := p_arr(i); p_arr(i) := p_arr(p_high); p_arr(p_high) := tmp;
        RETURN i;
    END;

    PROCEDURE quicksort(p_arr IN OUT int_arr, p_low IN PLS_INTEGER, p_high IN PLS_INTEGER) IS
        p PLS_INTEGER;
    BEGIN
        IF p_low < p_high THEN
            p := partition(p_arr, p_low, p_high);
            quicksort(p_arr, p_low, p - 1);
            quicksort(p_arr, p + 1, p_high);
        END IF;
    END;
BEGIN
    arr(1):=3; arr(2):=6; arr(3):=8; arr(4):=10;
    arr(5):=1; arr(6):=2; arr(7):=1;
    quicksort(arr, 1, n);
    FOR i IN 1 .. n LOOP
        DBMS_OUTPUT.PUT_LINE(arr(i));
    END LOOP;
END;
/
