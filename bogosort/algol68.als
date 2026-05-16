BEGIN
  INT n = 8;
  [n] INT arr := (3, 1, 4, 1, 5, 9, 2, 6);

  PROC is sorted = ([] INT a) BOOL:
  BEGIN
    BOOL sorted := TRUE;
    FOR i FROM 1 TO n - 1 DO
      IF a[i] > a[i+1] THEN sorted := FALSE FI
    OD;
    sorted
  END;

  PROC shuffle = REF [] INT a:
  BEGIN
    FOR i FROM n BY -1 TO 2 DO
      INT j = 1 + ENTIER (random * i);
      INT tmp = a[i];
      a[i] := a[j];
      a[j] := tmp
    OD
  END;

  WHILE NOT is sorted (arr) DO shuffle (arr) OD;

  FOR i FROM 1 TO n DO
    print ((arr[i], " "))
  OD;
  print (newline)
END
