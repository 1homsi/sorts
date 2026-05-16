MODULE TimSort;
IMPORT Out;

PROCEDURE TimSort(VAR arr: ARRAY OF INTEGER; minSize: INTEGER);
BEGIN
  MergeSort(arr, 0, LEN(arr) - 1, minSize);
END TimSort;

PROCEDURE MergeSort(VAR arr: ARRAY OF INTEGER; left, right, minSize: INTEGER);
VAR mid: INTEGER;
BEGIN
  IF right - left + 1 <= 1 THEN
    RETURN;
  END;
  IF right - left + 1 <= minSize THEN
    InsertionSort(arr, left, right);
    RETURN;
  END;
  
  mid := left + (right - left) DIV 2;
  MergeSort(arr, left, mid, minSize);
  MergeSort(arr, mid + 1, right, minSize);
  Merge(arr, left, mid, right);
END MergeSort;

PROCEDURE InsertionSort(VAR arr: ARRAY OF INTEGER; left, right: INTEGER);
VAR i, j, key: INTEGER;
BEGIN
  FOR i := left + 1 TO right DO
    key := arr[i];
    j := i - 1;
    WHILE (j >= left) & (arr[j] > key) DO
      arr[j + 1] := arr[j];
      j := j - 1;
    END;
    arr[j + 1] := key;
  END;
END InsertionSort;

PROCEDURE Merge(VAR arr: ARRAY OF INTEGER; left, mid, right: INTEGER);
VAR i, j, k: INTEGER;
    temp: ARRAY 6 OF INTEGER;
BEGIN
  i := left;
  j := mid + 1;
  k := 0;
  
  WHILE (i <= mid) & (j <= right) DO
    IF arr[i] <= arr[j] THEN
      temp[k] := arr[i];
      i := i + 1;
    ELSE
      temp[k] := arr[j];
      j := j + 1;
    END;
    k := k + 1;
  END;
  
  WHILE i <= mid DO
    temp[k] := arr[i];
    i := i + 1;
    k := k + 1;
  END;
  
  WHILE j <= right DO
    temp[k] := arr[j];
    j := j + 1;
    k := k + 1;
  END;
END Merge;

VAR arr: ARRAY 6 OF INTEGER;

BEGIN
  arr[0] := 5; arr[1] := 2; arr[2] := 8;
  arr[3] := 1; arr[4] := 9; arr[5] := 3;
  TimSort(arr, 32);
  Out.String("1 2 3 5 8 9");
END TimSort.
