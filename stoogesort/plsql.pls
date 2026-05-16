CREATE OR REPLACE PACKAGE stooge_pkg AS
    TYPE int_array IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;
    PROCEDURE stooge_sort(arr IN OUT int_array, first IN NUMBER, last IN NUMBER);
END stooge_pkg;
/

CREATE OR REPLACE PACKAGE BODY stooge_pkg AS
    PROCEDURE stooge_sort(arr IN OUT int_array, first IN NUMBER, last IN NUMBER) IS
        tmp NUMBER; t NUMBER; n NUMBER;
    BEGIN
        IF arr(first) > arr(last) THEN
            tmp := arr(first);
            arr(first) := arr(last);
            arr(last) := tmp;
        END IF;
        n := last - first + 1;
        IF n > 2 THEN
            t := FLOOR(n * 2 / 3);
            stooge_sort(arr, first, first + t - 1);
            stooge_sort(arr, last - t + 1, last);
            stooge_sort(arr, first, first + t - 1);
        END IF;
    END stooge_sort;
END stooge_pkg;
/

DECLARE
    arr stooge_pkg.int_array;
BEGIN
    arr(1):=3; arr(2):=1; arr(3):=4; arr(4):=1;
    arr(5):=5; arr(6):=9; arr(7):=2; arr(8):=6;
    stooge_pkg.stooge_sort(arr, 1, 8);
    FOR i IN 1..8 LOOP DBMS_OUTPUT.PUT(arr(i) || ' '); END LOOP;
    DBMS_OUTPUT.PUT_LINE('');
END;
/
