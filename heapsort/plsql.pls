DECLARE
    TYPE int_array IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    arr int_array;
    n   NUMBER := 6;
    i   NUMBER;
    tmp NUMBER;

    PROCEDURE heapify(p_n IN NUMBER, p_i IN NUMBER) IS
        largest NUMBER := p_i;
        left    NUMBER := 2 * p_i + 1;
        right   NUMBER := 2 * p_i + 2;
        t       NUMBER;
    BEGIN
        IF left < p_n AND arr(left) > arr(largest) THEN largest := left; END IF;
        IF right < p_n AND arr(right) > arr(largest) THEN largest := right; END IF;
        IF largest != p_i THEN
            t := arr(p_i); arr(p_i) := arr(largest); arr(largest) := t;
            heapify(p_n, largest);
        END IF;
    END heapify;
BEGIN
    arr(0) := 12; arr(1) := 11; arr(2) := 13;
    arr(3) := 5;  arr(4) := 6;  arr(5) := 7;
    i := FLOOR(n / 2) - 1;
    WHILE i >= 0 LOOP heapify(n, i); i := i - 1; END LOOP;
    i := n - 1;
    WHILE i > 0 LOOP
        tmp := arr(0); arr(0) := arr(i); arr(i) := tmp;
        heapify(i, 0);
        i := i - 1;
    END LOOP;
    FOR j IN 0..n-1 LOOP DBMS_OUTPUT.PUT(arr(j) || ' '); END LOOP;
    DBMS_OUTPUT.NEW_LINE;
END;
