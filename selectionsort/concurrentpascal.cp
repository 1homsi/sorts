program SelectionSort;
var arr: array[1..6] of integer;
    n, i, j, min_idx, tmp: integer;
    
procedure Sort;
begin
  n := 6;
  for i := 1 to n - 1 do
  begin
    min_idx := i;
    for j := i + 1 to n do
      if arr[j] < arr[min_idx] then
        min_idx := j;
    tmp := arr[i];
    arr[i] := arr[min_idx];
    arr[min_idx] := tmp;
  end;
end;

begin
  arr[1] := 5; arr[2] := 2; arr[3] := 8;
  arr[4] := 1; arr[5] := 9; arr[6] := 3;
  Sort;
  writeln(arr);
end.