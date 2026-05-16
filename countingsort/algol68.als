BEGIN
  INT n = 7;
  [1:n] INT arr := (4, 2, 2, 8, 3, 3, 1);
  INT mn := arr[1], mx := arr[1];
  FOR i TO n DO
    IF arr[i] < mn THEN mn := arr[i] FI;
    IF arr[i] > mx THEN mx := arr[i] FI
  OD;
  INT rng = mx - mn + 1;
  [0:rng-1] INT count := (0 FOR i TO rng);
  FOR i TO n DO
    count[arr[i] - mn] +:= 1
  OD;
  FOR i FROM 1 TO rng - 1 DO
    count[i] +:= count[i - 1]
  OD;
  [1:n] INT output;
  FOR i FROM n BY -1 TO 1 DO
    INT idx = arr[i] - mn;
    count[idx] -:= 1;
    output[count[idx] + 1] := arr[i]
  OD;
  FOR i TO n DO
    print(output[i]); print(blank)
  OD;
  print(newline)
END
