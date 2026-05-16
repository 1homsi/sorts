CREATE OR REPLACE PACKAGE bitonic_sort AS
    TYPE int_array IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    PROCEDURE sort(arr IN OUT int_array, lo IN PLS_INTEGER, cnt IN PLS_INTEGER, dir IN BOOLEAN);
END bitonic_sort;
/

CREATE OR REPLACE PACKAGE BODY bitonic_sort AS
    PROCEDURE compare_and_swap(arr IN OUT int_array, i IN PLS_INTEGER, j IN PLS_INTEGER, dir IN BOOLEAN) IS
        tmp NUMBER;
    BEGIN
        IF dir = (arr(i) > arr(j)) THEN
            tmp := arr(i); arr(i) := arr(j); arr(j) := tmp;
        END IF;
    END;

    PROCEDURE merge(arr IN OUT int_array, lo IN PLS_INTEGER, cnt IN PLS_INTEGER, dir IN BOOLEAN) IS
        k PLS_INTEGER;
    BEGIN
        IF cnt > 1 THEN
            k := cnt / 2;
            FOR i IN lo .. lo + k - 1 LOOP
                compare_and_swap(arr, i, i + k, dir);
            END LOOP;
            merge(arr, lo, k, dir);
            merge(arr, lo + k, k, dir);
        END IF;
    END;

    PROCEDURE sort(arr IN OUT int_array, lo IN PLS_INTEGER, cnt IN PLS_INTEGER, dir IN BOOLEAN) IS
        k PLS_INTEGER;
    BEGIN
        IF cnt > 1 THEN
            k := cnt / 2;
            sort(arr, lo, k, TRUE);
            sort(arr, lo + k, k, FALSE);
            merge(arr, lo, cnt, dir);
        END IF;
    END;
END bitonic_sort;
/

DECLARE
    arr bitonic_sort.int_array;
BEGIN
    arr(1):=3; arr(2):=7; arr(3):=4; arr(4):=8;
    arr(5):=6; arr(6):=2; arr(7):=1; arr(8):=5;
    bitonic_sort.sort(arr, 1, 8, TRUE);
    FOR i IN 1..8 LOOP DBMS_OUTPUT.PUT(arr(i)||' '); END LOOP;
    DBMS_OUTPUT.NEW_LINE;
END;
/
