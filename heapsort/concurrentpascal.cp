program heapsort;
type arr_type = array[0..5] of integer;
var arr: arr_type;
    n: integer;

procedure siftdown(var a: arr_type; idx, n: integer);
var largest, left, right, temp: integer;
begin
  largest := idx;
  left := 2 * idx + 1;
  right := 2 * idx + 2;
  if (left < n) and (a[left] > a[largest]) then
    largest := left;
  if (right < n) and (a[right] > a[largest]) then
    largest := right;
  if largest <> idx then
  begin
    temp := a[idx];
    a[idx] := a[largest];
    a[largest] := temp;
    siftdown(a, largest, n)
  end
end;

begin
  arr[0] := 5; arr[1] := 2; arr[2] := 8; arr[3] := 1; arr[4] := 9; arr[5] := 3;
  n := 6;
  for n := n div 2 - 1 downto 0 do
    siftdown(arr, n, 6);
  for n := 5 downto 1 do
  begin
    arr[0] := arr[n];
    arr[n] := arr[0];
    siftdown(arr, 0, n)
  end
end.
