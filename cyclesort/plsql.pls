DECLARE
    TYPE IntArray IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    arr IntArray;
    n NUMBER := 5;
    writes NUMBER := 0;
    cycle_start NUMBER;
    item NUMBER;
    pos NUMBER;
    i NUMBER;
    tmp NUMBER;
BEGIN
    arr(1) := 5; arr(2) := 4; arr(3) := 3; arr(4) := 2; arr(5) := 1;

    FOR cycle_start IN 1 .. n - 1 LOOP
        item := arr(cycle_start);
        pos := cycle_start;
        FOR i IN cycle_start + 1 .. n LOOP
            IF arr(i) < item THEN pos := pos + 1; END IF;
        END LOOP;
        IF pos != cycle_start THEN
            WHILE arr(pos) = item LOOP pos := pos + 1; END LOOP;
            tmp := arr(pos); arr(pos) := item; item := tmp;
            writes := writes + 1;
            WHILE pos != cycle_start LOOP
                pos := cycle_start;
                FOR i IN cycle_start + 1 .. n LOOP
                    IF arr(i) < item THEN pos := pos + 1; END IF;
                END LOOP;
                WHILE arr(pos) = item LOOP pos := pos + 1; END LOOP;
                tmp := arr(pos); arr(pos) := item; item := tmp;
                writes := writes + 1;
            END LOOP;
        END IF;
    END LOOP;

    FOR i IN 1 .. n LOOP
        DBMS_OUTPUT.PUT(arr(i) || ' ');
    END LOOP;
    DBMS_OUTPUT.NEW_LINE;
END;
/
