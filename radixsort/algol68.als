BEGIN
  PROC counting sort = (REF [] INT arr, INT exp) VOID:
  BEGIN
    INT n = UPB arr - LWB arr + 1;
    [n] INT output;
    [0:9] INT count;
    FOR i FROM 0 TO 9 DO count[i] := 0 OD;
    FOR i FROM LWB arr TO UPB arr DO
      INT idx = (arr[i] OVER exp) MOD 10;
      count[idx] +:= 1
    OD;
    FOR i FROM 1 TO 9 DO count[i] +:= count[i-1] OD;
    FOR i FROM UPB arr BY -1 TO LWB arr DO
      INT idx = (arr[i] OVER exp) MOD 10;
      count[idx] -:= 1;
      output[count[idx] + 1] := arr[i]
    OD;
    FOR i FROM LWB arr TO UPB arr DO
      arr[i] := output[i - LWB arr + 1]
    OD
  END;

  PROC radix sort = (REF [] INT arr) VOID:
  BEGIN
    INT max val := arr[LWB arr];
    FOR i FROM LWB arr TO UPB arr DO
      IF arr[i] > max val THEN max val := arr[i] FI
    OD;
    INT exp := 1;
    WHILE max val OVER exp > 0 DO
      counting sort(arr, exp);
      exp *:= 10
    OD
  END;

  [8] INT arr := (170, 45, 75, 90, 802, 24, 2, 66);
  radix sort(arr);
  FOR i FROM 1 TO 8 DO print((arr[i], " ")) OD;
  print(newline)
END
