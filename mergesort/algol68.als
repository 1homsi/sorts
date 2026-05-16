module ALGOL68

BEGIN
   PROC merge = ([]INT a, b) []INT:
   BEGIN
      [UPB a + UPB b]INT result;
      INT i := 1, j := 1, k := 1;
      WHILE i <= UPB a AND j <= UPB b DO
         IF a[i] <= b[j] THEN
            result[k] := a[i]; i +:= 1
         ELSE
            result[k] := b[j]; j +:= 1
         FI;
         k +:= 1
      OD;
      WHILE i <= UPB a DO result[k] := a[i]; i +:= 1; k +:= 1 OD;
      WHILE j <= UPB b DO result[k] := b[j]; j +:= 1; k +:= 1 OD;
      result
   END;

   PROC mergesort = ([]INT a) []INT:
   IF UPB a <= 1 THEN a
   ELSE
      INT mid = (UPB a) OVER 2;
      merge(mergesort(a[:mid]), mergesort(a[mid+1:]))
   FI;

   []INT data = (5, 2, 8, 1, 9, 3);
   print((mergesort(data)))
END
