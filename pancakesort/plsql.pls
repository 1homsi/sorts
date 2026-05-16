DECLARE
    TYPE int_array IS TABLE OF INTEGER INDEX BY PLS_INTEGER;
    arr int_array;
    n INTEGER := 7;
    size_v INTEGER;
    max_idx INTEGER;
    i INTEGER;
    left_v INTEGER;
    right_v INTEGER;
    tmp INTEGER;

    PROCEDURE flip(k IN INTEGER) IS
    BEGIN
        left_v := 1; right_v := k + 1;
        WHILE left_v < right_v LOOP
            tmp := arr(left_v);
            arr(left_v) := arr(right_v);
            arr(right_v) := tmp;
            left_v := left_v + 1;
            right_v := right_v - 1;
        END LOOP;
    END;
BEGIN
    arr(1):=3; arr(2):=6; arr(3):=2; arr(4):=7;
    arr(5):=4; arr(6):=1; arr(7):=5;

    size_v := n;
    WHILE size_v > 1 LOOP
        max_idx := 1;
        FOR i IN 2..size_v LOOP
            IF arr(i) > arr(max_idx) THEN max_idx := i; END IF;
        END LOOP;
        IF max_idx != size_v THEN
            IF max_idx != 1 THEN flip(max_idx - 1); END IF;
            flip(size_v - 1);
        END IF;
        size_v := size_v - 1;
    END LOOP;

    FOR i IN 1..n LOOP
        DBMS_OUTPUT.PUT(arr(i) || ' ');
    END LOOP;
    DBMS_OUTPUT.NEW_LINE;
END;
/
