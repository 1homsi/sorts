program RadixSort;

var
  arr: array[0..7] of Integer = (170, 45, 75, 90, 802, 24, 2, 66);

procedure CountingSort(var arr: array of Integer; exp: Integer);
var
  n, i, idx: Integer;
  output: array[0..7] of Integer;
  count: array[0..9] of Integer;
begin
  n := Length(arr);
  for i := 0 to 9 do count[i] := 0;
  for i := 0 to n-1 do
  begin
    idx := (arr[i] div exp) mod 10;
    Inc(count[idx]);
  end;
  for i := 1 to 9 do count[i] := count[i] + count[i-1];
  for i := n-1 downto 0 do
  begin
    idx := (arr[i] div exp) mod 10;
    Dec(count[idx]);
    output[count[idx]] := arr[i];
  end;
  for i := 0 to n-1 do arr[i] := output[i];
end;

procedure RadixSortArr(var arr: array of Integer);
var
  max, exp, i: Integer;
begin
  if Length(arr) = 0 then Exit;
  max := arr[0];
  for i := 1 to Length(arr)-1 do
    if arr[i] > max then max := arr[i];
  exp := 1;
  while max div exp > 0 do
  begin
    CountingSort(arr, exp);
    exp := exp * 10;
  end;
end;

var i: Integer;
begin
  RadixSortArr(arr);
  for i := 0 to 7 do Write(arr[i], ' ');
  WriteLn;
end.
