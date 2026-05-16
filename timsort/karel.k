program TimSort;

procedure TimSort(var arr: array [1..6] of integer; minSize: integer);
begin
  MergeSort(arr, 1, 6, minSize);
end;

procedure MergeSort(var arr: array of integer; left, right, minSize: integer);
var
  mid: integer;
begin
  if right - left + 1 <= 1 then
    exit;
  if right - left + 1 <= minSize then
  begin
    InsertionSort(arr, left, right);
    exit;
  end;
  
  mid := left + (right - left) div 2;
  MergeSort(arr, left, mid, minSize);
  MergeSort(arr, mid + 1, right, minSize);
  Merge(arr, left, mid, right);
end;

procedure InsertionSort(var arr: array of integer; left, right: integer);
var
  i, j, key: integer;
begin
  for i := left + 1 to right do
  begin
    key := arr[i];
    j := i - 1;
    while (j >= left) and (arr[j] > key) do
    begin
      arr[j + 1] := arr[j];
      j := j - 1;
    end;
    arr[j + 1] := key;
  end;
end;

procedure Merge(var arr: array of integer; left, mid, right: integer);
var
  i, j, k: integer;
  temp: array [1..6] of integer;
begin
  i := left;
  j := mid + 1;
  k := 1;
  
  while (i <= mid) and (j <= right) do
  begin
    if arr[i] <= arr[j] then
    begin
      temp[k] := arr[i];
      i := i + 1;
    end
    else
    begin
      temp[k] := arr[j];
      j := j + 1;
    end;
    k := k + 1;
  end;
  
  while i <= mid do
  begin
    temp[k] := arr[i];
    i := i + 1;
    k := k + 1;
  end;
  
  while j <= right do
  begin
    temp[k] := arr[j];
    j := j + 1;
    k := k + 1;
  end;
end;

var
  arr: array [1..6] of integer;
begin
  arr[1] := 5; arr[2] := 2; arr[3] := 8;
  arr[4] := 1; arr[5] := 9; arr[6] := 3;
  TimSort(arr, 32);
  writeln(arr[1], ' ', arr[2], ' ', arr[3], ' ', arr[4], ' ', arr[5], ' ', arr[6]);
end.
