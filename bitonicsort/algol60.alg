BEGIN
  PROCEDURE bitonicsort(arr, lo, cnt, dir);
    VALUE lo, cnt, dir;
    INTEGER ARRAY arr;
    INTEGER lo, cnt, dir;
    BEGIN
      INTEGER k;
      IF cnt > 1 THEN BEGIN
        k := cnt div 2;
        bitonicsort(arr, lo, k, 1);
        bitonicsort(arr, lo + k, k, 0);
        bitonicmerge(arr, lo, cnt, dir);
      END;
    END;

  PROCEDURE bitonicmerge(arr, lo, cnt, dir);
    VALUE lo, cnt, dir;
    INTEGER ARRAY arr;
    INTEGER lo, cnt, dir;
    BEGIN
      INTEGER k, i, tmp;
      IF cnt > 1 THEN BEGIN
        k := cnt div 2;
        FOR i := lo STEP 1 UNTIL lo + cnt - k - 1 DO
          IF (arr[i] > arr[i + k]) = (dir = 1) THEN BEGIN
            tmp := arr[i];
            arr[i] := arr[i + k];
            arr[i + k] := tmp;
          END;
        bitonicmerge(arr, lo, k, dir);
        bitonicmerge(arr, lo + k, k, dir);
      END;
    END;

  INTEGER ARRAY arr[1:8];
  INTEGER i;
  arr[1] := 5; arr[2] := 2; arr[3] := 8; arr[4] := 1;
  arr[5] := 9; arr[6] := 3; arr[7] := 7; arr[8] := 4;

  bitonicsort(arr, 1, 8, 1);

  FOR i := 1 STEP 1 UNTIL 8 DO
    OUTINT(arr[i], 1);

END
