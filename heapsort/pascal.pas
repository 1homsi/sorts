program HeapSort;

var
  arr: array[0..5] of integer = (12, 11, 13, 5, 6, 7);
  n, i, tmp: integer;

procedure Heapify(var a: array of integer; n, i: integer);
var
  largest, left, right, t: integer;
begin
  largest := i;
  left := 2 * i + 1;
  right := 2 * i + 2;
  if (left < n) and (a[left] > a[largest]) then largest := left;
  if (right < n) and (a[right] > a[largest]) then largest := right;
  if largest <> i then
  begin
    t := a[i]; a[i] := a[largest]; a[largest] := t;
    Heapify(a, n, largest);
  end;
end;

begin
  n := 6;
  for i := n div 2 - 1 downto 0 do Heapify(arr, n, i);
  for i := n - 1 downto 1 do
  begin
    tmp := arr[0]; arr[0] := arr[i]; arr[i] := tmp;
    Heapify(arr, i, 0);
  end;
  for i := 0 to n - 1 do write(arr[i], ' ');
  writeln;
end.
