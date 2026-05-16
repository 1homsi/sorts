CREATE OR REPLACE PROCEDURE bucket_sort IS
    TYPE float_arr IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    TYPE bucket_t IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    TYPE buckets_t IS TABLE OF bucket_t INDEX BY PLS_INTEGER;

    arr float_arr;
    buckets buckets_t;
    n PLS_INTEGER := 10;
    min_v NUMBER;
    max_v NUMBER;
    idx PLS_INTEGER;
    pos PLS_INTEGER := 1;
    key NUMBER;
    j PLS_INTEGER;
    i PLS_INTEGER;
    b PLS_INTEGER;

    PROCEDURE insertion_sort(b IN PLS_INTEGER) IS
        m PLS_INTEGER;
    BEGIN
        m := buckets(b).COUNT;
        FOR ii IN 2..m LOOP
            key := buckets(b)(ii);
            j := ii - 1;
            WHILE j >= 1 AND buckets(b)(j) > key LOOP
                buckets(b)(j + 1) := buckets(b)(j);
                j := j - 1;
            END LOOP;
            buckets(b)(j + 1) := key;
        END LOOP;
    END;

BEGIN
    arr(1) := 0.78; arr(2) := 0.17; arr(3) := 0.39; arr(4) := 0.26; arr(5) := 0.72;
    arr(6) := 0.94; arr(7) := 0.21; arr(8) := 0.12; arr(9) := 0.23; arr(10) := 0.68;

    min_v := arr(1); max_v := arr(1);
    FOR i IN 1..n LOOP
        IF arr(i) < min_v THEN min_v := arr(i); END IF;
        IF arr(i) > max_v THEN max_v := arr(i); END IF;
    END LOOP;

    FOR i IN 1..n LOOP
        idx := TRUNC((arr(i) - min_v) / (max_v - min_v + 1) * n) + 1;
        IF idx > n THEN idx := n; END IF;
        IF NOT buckets.EXISTS(idx) THEN
            buckets(idx) := bucket_t();
        END IF;
        buckets(idx)(buckets(idx).COUNT + 1) := arr(i);
    END LOOP;

    FOR b IN 1..n LOOP
        IF buckets.EXISTS(b) THEN
            insertion_sort(b);
            FOR i IN 1..buckets(b).COUNT LOOP
                arr(pos) := buckets(b)(i);
                pos := pos + 1;
            END LOOP;
        END IF;
    END LOOP;

    FOR i IN 1..n LOOP
        DBMS_OUTPUT.PUT_LINE(arr(i));
    END LOOP;
END;
/
