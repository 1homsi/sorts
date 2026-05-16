program StoogeSort;

procedure Sort(var a : array; i, j : integer);
var
  temp, t : integer;
begin
  if a[j] < a[i] then
  begin
    temp := a[j];
    a[j] := a[i];
    a[i] := temp;
  end;
  if j - i > 1 then
  begin
    t := (j - i + 1) div 3;
    Sort(a, i, j - t);
    Sort(a, i + t, j);
    Sort(a, i, j - t);
  end;
end;

var arr : array[0..5] of integer;
begin
  Sort(arr, 0, 5);
end.
