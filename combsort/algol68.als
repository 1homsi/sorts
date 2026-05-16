PROC comb sort = (REF [] INT arr) VOID:
BEGIN
    INT n := UPB arr;
    INT gap := n;
    REAL shrink = 1.3;
    BOOL sorted := FALSE;
    WHILE NOT sorted DO
        gap := ENTIER (gap / shrink);
        IF gap <= 1 THEN gap := 1; sorted := TRUE FI;
        FOR i FROM 1 TO n - gap DO
            IF arr[i] > arr[i + gap] THEN
                INT tmp := arr[i];
                arr[i] := arr[i + gap];
                arr[i + gap] := tmp;
                sorted := FALSE
            FI
        OD
    OD
END;
