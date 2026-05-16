program TimSort;

var
  arr: array [1..6] of integer;
  
procedure TimSort(var a: array of integer; minSize: integer);
begin
  MergeSort(a, 1, 6, minSize);
end;

procedure MergeSort(var a: array of integer; left, right, minSize: integer);
var
  mid: integer;
begin
  if right - left + 1 <= 1 then
    exit;
  if right - left + 1 <= minSize then
  begin
    InsertionSort(a, left, right);
    exit;
  end;
  
  mid := left + (right - left) div 2;
  MergeSort(a, left, mid, minSize);
  MergeSort(a, mid + 1, right, minSize);
  Merge(a, left, mid, right);
end;

procedure InsertionSort(var a: array of integer; left, right: integer);
var
  i, j, key: integer;
begin
  for i := left + 1 to right do
  begin
    key := a[i];
    j := i - 1;
    while (j >= left) and (a[j] > key) do
    begin
      a[j + 1] := a[j];
      j := j - 1;
    end;
    a[j + 1] := key;
  end;
end;

procedure Merge(var a: array of integer; left, mid, right: integer);
var
  i, j, k: integer;
  temp: array [1..6] of integer;
begin
  i := left;
  j := mid + 1;
  k := 1;
  
  while (i <= mid) and (j <= right) do
  begin
    if a[i] <= a[j] then
    begin
      temp[k] := a[i];
      i := i + 1;
    end
    else
    begin
      temp[k] := a[j];
      j := j + 1;
    end;
    k := k + 1;
  end;
  
  while i <= mid do
  begin
    temp[k] := a[i];
    i := i + 1;
    k := k + 1;
  end;
  
  while j <= right do
  begin
    temp[k] := a[j];
    j := j + 1;
    k := k + 1;
  end;
end;

begin
  arr[1] := 5; arr[2] := 2; arr[3] := 8;
  arr[4] := 1; arr[5] := 9; arr[6] := 3;
  TimSort(arr, 32);
  writeln(arr[1], ' ', arr[2], ' ', arr[3], ' ', arr[4], ' ', arr[5], ' ', arr[6]);
end.
