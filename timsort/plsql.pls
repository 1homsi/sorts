CREATE OR REPLACE PACKAGE timsort_pkg AS
    TYPE int_array IS TABLE OF INTEGER INDEX BY PLS_INTEGER;
    PROCEDURE timsort(arr IN OUT int_array, n IN INTEGER);
END timsort_pkg;
/

CREATE OR REPLACE PACKAGE BODY timsort_pkg AS
    PROCEDURE insertion_sort(arr IN OUT int_array, p_left IN INTEGER, p_right IN INTEGER) IS
        v_key INTEGER;
        v_j   INTEGER;
    BEGIN
        FOR i IN p_left + 1 .. p_right LOOP
            v_key := arr(i);
            v_j := i - 1;
            WHILE v_j >= p_left AND arr(v_j) > v_key LOOP
                arr(v_j + 1) := arr(v_j);
                v_j := v_j - 1;
            END LOOP;
            arr(v_j + 1) := v_key;
        END LOOP;
    END insertion_sort;

    PROCEDURE merge_runs(arr IN OUT int_array, p_left IN INTEGER, p_mid IN INTEGER, p_right IN INTEGER) IS
        TYPE local_arr IS TABLE OF INTEGER;
        lp local_arr := local_arr();
        rp local_arr := local_arr();
        ln INTEGER := p_mid - p_left + 1;
        rn INTEGER := p_right - p_mid;
        i  INTEGER := 1;
        j  INTEGER := 1;
        k  INTEGER := p_left;
    BEGIN
        lp.EXTEND(ln);
        rp.EXTEND(rn);
        FOR x IN 1 .. ln LOOP lp(x) := arr(p_left + x - 1); END LOOP;
        FOR x IN 1 .. rn LOOP rp(x) := arr(p_mid + x); END LOOP;
        WHILE i <= ln AND j <= rn LOOP
            IF lp(i) <= rp(j) THEN arr(k) := lp(i); i := i + 1;
            ELSE arr(k) := rp(j); j := j + 1; END IF;
            k := k + 1;
        END LOOP;
        WHILE i <= ln LOOP arr(k) := lp(i); i := i + 1; k := k + 1; END LOOP;
        WHILE j <= rn LOOP arr(k) := rp(j); j := j + 1; k := k + 1; END LOOP;
    END merge_runs;

    PROCEDURE timsort(arr IN OUT int_array, n IN INTEGER) IS
        v_min_run INTEGER := 32;
        v_i       INTEGER := 1;
        v_right   INTEGER;
        v_size    INTEGER;
        v_left    INTEGER;
        v_mid     INTEGER;
    BEGIN
        WHILE v_i <= n LOOP
            v_right := LEAST(v_i + v_min_run - 1, n);
            insertion_sort(arr, v_i, v_right);
            v_i := v_i + v_min_run;
        END LOOP;
        v_size := v_min_run;
        WHILE v_size < n LOOP
            v_left := 1;
            WHILE v_left <= n LOOP
                v_mid := LEAST(v_left + v_size - 1, n);
                v_right := LEAST(v_left + 2 * v_size - 1, n);
                IF v_mid < v_right THEN
                    merge_runs(arr, v_left, v_mid, v_right);
                END IF;
                v_left := v_left + 2 * v_size;
            END LOOP;
            v_size := v_size * 2;
        END LOOP;
    END timsort;
END timsort_pkg;
/
