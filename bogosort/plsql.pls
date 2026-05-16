DECLARE
    TYPE int_array IS TABLE OF INTEGER INDEX BY PLS_INTEGER;
    arr int_array;
    n INTEGER := 8;
    sorted BOOLEAN;
    tmp INTEGER;
    j INTEGER;

    FUNCTION is_sorted RETURN BOOLEAN IS
    BEGIN
        FOR i IN 1..n-1 LOOP
            IF arr(i) > arr(i+1) THEN RETURN FALSE; END IF;
        END LOOP;
        RETURN TRUE;
    END;

    PROCEDURE do_shuffle IS
    BEGIN
        FOR i IN REVERSE 2..n LOOP
            j := TRUNC(DBMS_RANDOM.VALUE(1, i+1));
            tmp := arr(i);
            arr(i) := arr(j);
            arr(j) := tmp;
        END LOOP;
    END;
BEGIN
    arr(1):=3; arr(2):=1; arr(3):=4; arr(4):=1;
    arr(5):=5; arr(6):=9; arr(7):=2; arr(8):=6;

    LOOP
        EXIT WHEN is_sorted;
        do_shuffle;
    END LOOP;

    FOR i IN 1..n LOOP
        DBMS_OUTPUT.PUT(arr(i) || ' ');
    END LOOP;
    DBMS_OUTPUT.NEW_LINE;
END;
/
