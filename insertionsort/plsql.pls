CREATE OR REPLACE PROCEDURE insertion_sort(arr IN OUT DBMS_SQL.NUMBER_TABLE) IS
    n   PLS_INTEGER := arr.COUNT;
    key NUMBER;
    j   PLS_INTEGER;
BEGIN
    FOR i IN 2 .. n LOOP
        key := arr(i);
        j   := i - 1;
        WHILE j >= 1 AND arr(j) > key LOOP
            arr(j + 1) := arr(j);
            j := j - 1;
        END LOOP;
        arr(j + 1) := key;
    END LOOP;
END insertion_sort;
/
