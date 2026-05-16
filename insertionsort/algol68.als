PROC insertion sort = (REF [] INT arr) VOID:
BEGIN
  INT n := UPB arr;
  FOR i FROM 2 TO n DO
    INT key := arr[i];
    INT j := i - 1;
    WHILE j >= 1 AND arr[j] > key DO
      arr[j+1] := arr[j];
      j -:= 1
    OD;
    arr[j+1] := key
  OD
END;
