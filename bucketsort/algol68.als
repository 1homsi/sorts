BEGIN
    PROC insertion sort = (REF []REAL bucket, INT n) VOID:
    BEGIN
        INT j;
        REAL key;
        FOR i FROM 2 TO n DO
            key := bucket[i];
            j := i - 1;
            WHILE j >= 1 AND bucket[j] > key DO
                bucket[j+1] := bucket[j];
                j -:= 1
            OD;
            bucket[j+1] := key
        OD
    END;

    PROC bucket sort = (REF []REAL arr, INT n) VOID:
    BEGIN
        REAL min val := arr[1], max val := arr[1];
        FOR i FROM 2 TO n DO
            IF arr[i] < min val THEN min val := arr[i] FI;
            IF arr[i] > max val THEN max val := arr[i] FI
        OD;
        [n][n]REAL buckets;
        [n]INT counts;
        FOR i TO n DO counts[i] := 0 OD;
        FOR i TO n DO
            INT idx := ENTIER((arr[i] - min val) / (max val - min val + 1) * n) + 1;
            IF idx > n THEN idx := n FI;
            counts[idx] +:= 1;
            buckets[idx][counts[idx]] := arr[i]
        OD;
        INT pos := 1;
        FOR b TO n DO
            insertion sort(buckets[b], counts[b]);
            FOR k TO counts[b] DO
                arr[pos] := buckets[b][k];
                pos +:= 1
            OD
        OD
    END;

    [10]REAL data;
    data[1]:=0.78; data[2]:=0.17; data[3]:=0.39; data[4]:=0.26; data[5]:=0.72;
    data[6]:=0.94; data[7]:=0.21; data[8]:=0.12; data[9]:=0.23; data[10]:=0.68;
    bucket sort(data, 10);
    FOR i TO 10 DO print(data[i]); print(" ") OD;
    print(newline)
END
