DECLARE
    TYPE int_array IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    arr int_array;
    n   PLS_INTEGER := 7;
    tmp NUMBER;
    swapped BOOLEAN;
BEGIN
    arr(1) := 64; arr(2) := 34; arr(3) := 25; arr(4) := 12;
    arr(5) := 22; arr(6) := 11; arr(7) := 90;

    LOOP
        swapped := FALSE;
        FOR i IN 1 .. n - 1 LOOP
            IF arr(i) > arr(i + 1) THEN
                tmp := arr(i);
                arr(i) := arr(i + 1);
                arr(i + 1) := tmp;
                swapped := TRUE;
            END IF;
        END LOOP;
        n := n - 1;
        EXIT WHEN NOT swapped;
    END LOOP;

    FOR i IN 1 .. 7 LOOP
        DBMS_OUTPUT.PUT_LINE(arr(i));
    END LOOP;
END;
/
