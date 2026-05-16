program BogSort;
var
  arr: array [1..3] of integer;
  i, j, n, tmp, sorted: integer;

begin
  arr[1] := 3;
  arr[2] := 1;
  arr[3] := 2;
  n := 3;

  repeat
    sorted := 1;
    for i := 1 to n - 1 do
      if arr[i] > arr[i+1] then
        sorted := 0;
    if sorted = 0 then
    begin
      for i := 1 to n do
      begin
        j := random(n) + 1;
        tmp := arr[i];
        arr[i] := arr[j];
        arr[j] := tmp;
      end;
    end;
  until sorted = 1;
end.
