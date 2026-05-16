BEGIN
  INT min run = 32;
  [9]INT arr := (5, 2, 8, 1, 9, 3, 7, 4, 6);
  INT n := 9;

  PROC insertion sort = (REF[]INT a, INT left, INT right) VOID:
  BEGIN
    FOR i FROM left + 1 TO right DO
      INT key := a[i];
      INT j := i - 1;
      WHILE j >= left AND a[j] > key DO
        a[j + 1] := a[j];
        j -:= 1
      OD;
      a[j + 1] := key
    OD
  END;

  PROC merge = (REF[]INT a, INT left, INT mid, INT right) VOID:
  BEGIN
    INT ln := mid - left + 1;
    INT rn := right - mid;
    [ln]INT lp;
    [rn]INT rp;
    FOR i FROM 1 TO ln DO lp[i] := a[left + i - 1] OD;
    FOR i FROM 1 TO rn DO rp[i] := a[mid + i] OD;
    INT i := 1, j := 1, k := left;
    WHILE i <= ln AND j <= rn DO
      IF lp[i] <= rp[j] THEN a[k] := lp[i]; i +:= 1
      ELSE a[k] := rp[j]; j +:= 1 FI;
      k +:= 1
    OD;
    WHILE i <= ln DO a[k] := lp[i]; i +:= 1; k +:= 1 OD;
    WHILE j <= rn DO a[k] := rp[j]; j +:= 1; k +:= 1 OD
  END;

  INT i := 1;
  WHILE i <= n DO
    INT right := IF i + min run - 1 < n THEN i + min run - 1 ELSE n FI;
    insertion sort(arr, i, right);
    i +:= min run
  OD;

  INT size := min run;
  WHILE size < n DO
    INT left := 1;
    WHILE left <= n DO
      INT mid := IF left + size - 1 < n THEN left + size - 1 ELSE n FI;
      INT right := IF left + 2*size - 1 < n THEN left + 2*size - 1 ELSE n FI;
      IF mid < right THEN merge(arr, left, mid, right) FI;
      left +:= 2 * size
    OD;
    size *:= 2
  OD;

  FOR i FROM 1 TO n DO print((arr[i], " ")) OD;
  print(newline)
END
