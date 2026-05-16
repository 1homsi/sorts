program radixsort;
type
  arr_type = array [1..6] of integer;
var
  arr : arr_type;
  max, exp, i : integer;

procedure sort_step(var a : arr_type; e : integer);
begin
  max := a[1];
  for i := 2 to 6 do
    if a[i] > max then max := a[i];
end;

begin
  arr[1] := 5; arr[2] := 2; arr[3] := 8;
  arr[4] := 1; arr[5] := 9; arr[6] := 3;

  max := arr[1];
  exp := 1;
  while max / exp > 0 do
  begin
    sort_step(arr, exp);
    exp := exp * 10;
  end;

  for i := 1 to 6 do
    writeln(arr[i]);
end.
