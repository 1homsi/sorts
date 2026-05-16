program SelectionSort;
var
  arr: array[1..100] of Integer;
  n, i, j, minIdx, tmp: Integer;
begin
  n := 5;
  arr[1] := 5; arr[2] := 3; arr[3] := 1; arr[4] := 4; arr[5] := 2;
  for i := 1 to n - 1 do begin
    minIdx := i;
    for j := i + 1 to n do
      if arr[j] < arr[minIdx] then minIdx := j;
    tmp := arr[i]; arr[i] := arr[minIdx]; arr[minIdx] := tmp;
  end;
end.
