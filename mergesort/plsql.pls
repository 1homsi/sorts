CREATE OR REPLACE PACKAGE merge_sort_pkg AS
    TYPE int_array IS TABLE OF INTEGER INDEX BY PLS_INTEGER;
    PROCEDURE merge_proc(arr IN OUT int_array, tmp IN OUT int_array, lo IN INTEGER, mid IN INTEGER, hi IN INTEGER);
    PROCEDURE merge_sort(arr IN OUT int_array, tmp IN OUT int_array, lo IN INTEGER, hi IN INTEGER);
END;
/

CREATE OR REPLACE PACKAGE BODY merge_sort_pkg AS
    PROCEDURE merge_proc(arr IN OUT int_array, tmp IN OUT int_array, lo IN INTEGER, mid IN INTEGER, hi IN INTEGER) IS
        i INTEGER := lo;
        j INTEGER := mid + 1;
        k INTEGER := lo;
    BEGIN
        WHILE i <= mid AND j <= hi LOOP
            IF arr(i) <= arr(j) THEN tmp(k) := arr(i); i := i + 1;
            ELSE tmp(k) := arr(j); j := j + 1; END IF;
            k := k + 1;
        END LOOP;
        WHILE i <= mid LOOP tmp(k) := arr(i); i := i + 1; k := k + 1; END LOOP;
        WHILE j <= hi LOOP tmp(k) := arr(j); j := j + 1; k := k + 1; END LOOP;
        FOR x IN lo..hi LOOP arr(x) := tmp(x); END LOOP;
    END;

    PROCEDURE merge_sort(arr IN OUT int_array, tmp IN OUT int_array, lo IN INTEGER, hi IN INTEGER) IS
        mid INTEGER;
    BEGIN
        IF lo >= hi THEN RETURN; END IF;
        mid := (lo + hi) / 2;
        merge_sort(arr, tmp, lo, mid);
        merge_sort(arr, tmp, mid + 1, hi);
        merge_proc(arr, tmp, lo, mid, hi);
    END;
END;
/

DECLARE
    arr merge_sort_pkg.int_array;
    tmp merge_sort_pkg.int_array;
BEGIN
    arr(1):=38; arr(2):=27; arr(3):=43; arr(4):=3;
    arr(5):=9; arr(6):=82; arr(7):=10;
    merge_sort_pkg.merge_sort(arr, tmp, 1, 7);
    FOR i IN 1..7 LOOP DBMS_OUTPUT.PUT_LINE(arr(i)); END LOOP;
END;
/
