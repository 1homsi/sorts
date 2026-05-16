program mergesort;
type
  array_type = array [1..6] of integer;

procedure merge(var arr: array_type; left, mid, right: integer);
var
  i, j, k: integer;
  result: array_type;
begin
  i := left;
  j := mid + 1;
  k := 1;
  
  while (i <= mid) and (j <= right) do
  begin
    if arr[i] <= arr[j] then
    begin
      result[k] := arr[i];
      i := i + 1;
    end else
    begin
      result[k] := arr[j];
      j := j + 1;
    end;
    k := k + 1;
  end;
  
  while i <= mid do
  begin
    result[k] := arr[i];
    i := i + 1;
    k := k + 1;
  end;
  
  while j <= right do
  begin
    result[k] := arr[j];
    j := j + 1;
    k := k + 1;
  end;
  
  for k := 1 to right - left + 1 do
    arr[left + k - 1] := result[k];
end;

procedure mergesort(var arr: array_type; left, right: integer);
var mid: integer;
begin
  if left < right then
  begin
    mid := (left + right) div 2;
    mergesort(arr, left, mid);
    mergesort(arr, mid + 1, right);
    merge(arr, left, mid, right);
  end;
end;

var arr: array_type;
begin
  arr[1] := 5; arr[2] := 2; arr[3] := 8; arr[4] := 1; arr[5] := 9; arr[6] := 3;
  mergesort(arr, 1, 6);
  writeln(arr);
end.
