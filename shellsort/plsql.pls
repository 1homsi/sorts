CREATE OR REPLACE PROCEDURE shell_sort IS
    TYPE int_array IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
    arr int_array;
    n   NUMBER := 7;
    gap NUMBER;
    temp NUMBER;
    j   NUMBER;
BEGIN
    arr(1) := 64; arr(2) := 34; arr(3) := 25; arr(4) := 12;
    arr(5) := 22; arr(6) := 11; arr(7) := 90;
    gap := TRUNC(n / 2);
    WHILE gap > 0 LOOP
        FOR i IN (gap + 1)..n LOOP
            temp := arr(i);
            j := i;
            WHILE j > gap AND arr(j - gap) > temp LOOP
                arr(j) := arr(j - gap);
                j := j - gap;
            END LOOP;
            arr(j) := temp;
        END LOOP;
        gap := TRUNC(gap / 2);
    END LOOP;
    FOR i IN 1..n LOOP
        DBMS_OUTPUT.PUT(arr(i) || ' ');
    END LOOP;
    DBMS_OUTPUT.NEW_LINE;
END;
/
