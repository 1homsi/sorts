program SelectionSort;
var
  arr: array of Integer;
  i, j, minIdx, tmp, n: Integer;
begin
  n := 5;
  SetLength(arr, n);
  arr[0] := 5; arr[1] := 3; arr[2] := 1; arr[3] := 4; arr[4] := 2;
  for i := 0 to n - 2 do begin
    minIdx := i;
    for j := i + 1 to n - 1 do
      if arr[j] < arr[minIdx] then minIdx := j;
    tmp := arr[i]; arr[i] := arr[minIdx]; arr[minIdx] := tmp;
  end;
end.
