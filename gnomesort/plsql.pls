CREATE OR REPLACE PROCEDURE gnome_sort IS
    TYPE int_array IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    arr int_array;
    i   PLS_INTEGER := 1;
    n   PLS_INTEGER := 10;
    tmp NUMBER;
BEGIN
    arr(1) := 5; arr(2) := 3; arr(3) := 8; arr(4) := 1; arr(5) := 9;
    arr(6) := 2; arr(7) := 7; arr(8) := 4; arr(9) := 6; arr(10) := 0;
    WHILE i <= n LOOP
        IF i = 1 OR arr(i) >= arr(i - 1) THEN
            i := i + 1;
        ELSE
            tmp := arr(i);
            arr(i) := arr(i - 1);
            arr(i - 1) := tmp;
            i := i - 1;
        END IF;
    END LOOP;
END gnome_sort;
/
