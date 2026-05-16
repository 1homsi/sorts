begin
  integer array arr[1:6];
  arr[1] := 5; arr[2] := 2; arr[3] := 8; arr[4] := 1; arr[5] := 9; arr[6] := 3;

  radixsort(arr, 6);

  for i := 1 step 1 until 6 do print(arr[i]);
end

procedure radixsort(arr, n);
integer n;
integer array arr;
begin
  integer max, exp;
  max := arr[1];
  for i := 2 step 1 until n do
    if arr[i] > max then max := arr[i];

  exp := 1;
  while max / exp > 0 do
  begin
    countingSortByExp(arr, n, exp);
    exp := exp * 10;
  end
end;

procedure countingSortByExp(arr, n, exp);
integer n, exp;
integer array arr;
begin
  integer array output[1:n], count[0:9];
  integer i, idx;
  for i := 0 step 1 until 9 do count[i] := 0;
  for i := 1 step 1 until n do
  begin
    idx := (arr[i] / exp) mod 10;
    count[idx] := count[idx] + 1;
  end;
end;
