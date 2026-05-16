BEGIN
  INT n = 5;
  [0:n-1] INT arr := (5, 4, 3, 2, 1);
  INT writes := 0;

  FOR cycle start FROM 0 TO n - 2 DO
    INT item := arr[cycle start];
    INT pos := cycle start;
    FOR i FROM cycle start + 1 TO n - 1 DO
      IF arr[i] < item THEN pos +:= 1 FI
    OD;
    IF pos /= cycle start THEN
      WHILE item = arr[pos] DO pos +:= 1 OD;
      INT tmp := arr[pos];
      arr[pos] := item;
      item := tmp;
      writes +:= 1;
      WHILE pos /= cycle start DO
        pos := cycle start;
        FOR i FROM cycle start + 1 TO n - 1 DO
          IF arr[i] < item THEN pos +:= 1 FI
        OD;
        WHILE item = arr[pos] DO pos +:= 1 OD;
        tmp := arr[pos];
        arr[pos] := item;
        item := tmp;
        writes +:= 1
      OD
    FI
  OD;

  FOR i FROM 0 TO n - 1 DO
    print((arr[i], " "))
  OD;
  print(newline)
END
