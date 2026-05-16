BEGIN
  INT n = 6;
  [0:5] INT arr;
  arr[0]:=12; arr[1]:=11; arr[2]:=13; arr[3]:=5; arr[4]:=6; arr[5]:=7;

  PROC heapify = (REF []INT a, INT sz, INT i) VOID:
  BEGIN
    INT largest := i;
    INT left := 2*i+1;
    INT right := 2*i+2;
    IF left < sz AND a[left] > a[largest] THEN largest := left FI;
    IF right < sz AND a[right] > a[largest] THEN largest := right FI;
    IF largest /= i THEN
      INT tmp := a[i]; a[i] := a[largest]; a[largest] := tmp;
      heapify(a, sz, largest)
    FI
  END;

  FOR i FROM n OVER 2 - 1 BY -1 TO 0 DO heapify(arr, n, i) OD;
  FOR i FROM n-1 BY -1 TO 1 DO
    INT tmp := arr[0]; arr[0] := arr[i]; arr[i] := tmp;
    heapify(arr, i, 0)
  OD;

  FOR i FROM 0 TO n-1 DO print((arr[i], " ")) OD;
  print(newline)
END
