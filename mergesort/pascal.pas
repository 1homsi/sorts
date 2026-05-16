program MergeSort;

var
  arr: array[1..7] of integer = (38, 27, 43, 3, 9, 82, 10);

procedure Merge(var a: array of integer; lo, mid, hi: integer);
var
  tmp: array[0..6] of integer;
  i, j, k: integer;
begin
  i := lo; j := mid + 1; k := 0;
  while (i <= mid) and (j <= hi) do begin
    if a[i] <= a[j] then begin tmp[k] := a[i]; inc(i); end
    else begin tmp[k] := a[j]; inc(j); end;
    inc(k);
  end;
  while i <= mid do begin tmp[k] := a[i]; inc(i); inc(k); end;
  while j <= hi do begin tmp[k] := a[j]; inc(j); inc(k); end;
  for i := lo to hi do a[i] := tmp[i - lo];
end;

procedure MSort(var a: array of integer; lo, hi: integer);
var mid: integer;
begin
  if lo >= hi then exit;
  mid := (lo + hi) div 2;
  MSort(a, lo, mid);
  MSort(a, mid + 1, hi);
  Merge(a, lo, mid, hi);
end;

var i: integer;
begin
  MSort(arr, 1, 7);
  for i := 1 to 7 do write(arr[i], ' ');
  writeln;
end.
