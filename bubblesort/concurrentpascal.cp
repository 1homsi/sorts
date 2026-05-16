program BubbleSort;
var arr: array[1..6] of integer;
    n, i, j, temp: integer;
begin
  arr[1] := 5; arr[2] := 2; arr[3] := 8; arr[4] := 1; arr[5] := 9; arr[6] := 3;
  n := 6;
  for i := 1 to n do
    for j := 1 to n - i do
      if arr[j] > arr[j+1] then
      begin
        temp := arr[j];
        arr[j] := arr[j+1];
        arr[j+1] := temp;
      end;
  for i := 1 to n do
    writeln(arr[i]);
end.