MODULE MergeSort;

PROCEDURE Merge(VAR arr: ARRAY OF INTEGER; left, mid, right: INTEGER);
VAR
  i, j, k: INTEGER;
  result: ARRAY 10 OF INTEGER;
BEGIN
  i := left;
  j := mid + 1;
  k := 0;
  
  WHILE (i <= mid) & (j <= right) DO
    IF arr[i] <= arr[j] THEN
      result[k] := arr[i];
      INC(i);
    ELSE
      result[k] := arr[j];
      INC(j);
    END;
    INC(k);
  END;
  
  WHILE i <= mid DO
    result[k] := arr[i];
    INC(i);
    INC(k);
  END;
  
  WHILE j <= right DO
    result[k] := arr[j];
    INC(j);
    INC(k);
  END;
END Merge;

PROCEDURE MergeSort(VAR arr: ARRAY OF INTEGER; left, right: INTEGER);
VAR
  mid: INTEGER;
BEGIN
  IF left < right THEN
    mid := (left + right) DIV 2;
    MergeSort(arr, left, mid);
    MergeSort(arr, mid + 1, right);
    Merge(arr, left, mid, right);
  END;
END MergeSort;

VAR
  arr: ARRAY 6 OF INTEGER;
BEGIN
  arr[0] := 5; arr[1] := 2; arr[2] := 8; arr[3] := 1; arr[4] := 9; arr[5] := 3;
  MergeSort(arr, 0, 5);
END MergeSort.
