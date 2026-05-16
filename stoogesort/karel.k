program stoogesort;

procedure sort(var a : array; i, j : integer);
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
    sort(a, i, j - t);
    sort(a, i + t, j);
    sort(a, i, j - t);
  end;
end;

var
  arr : array[1..6] of integer;
begin
  arr[1] := 5; arr[2] := 2; arr[3] := 8;
  arr[4] := 1; arr[5] := 9; arr[6] := 3;
  sort(arr, 1, 6);
end.
