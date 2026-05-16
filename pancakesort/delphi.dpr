program PancakeSort;
{$APPTYPE CONSOLE}
var
  arr: array[0..6] of Integer = (3, 6, 2, 7, 4, 1, 5);
  n, size, i, maxIdx, left, right, tmp: Integer;

procedure Flip(k: Integer);
begin
  left := 0; right := k;
  while left < right do begin
    tmp := arr[left]; arr[left] := arr[right]; arr[right] := tmp;
    Inc(left); Dec(right);
  end;
end;

begin
  n := 7;
  for size := n downto 2 do begin
    maxIdx := 0;
    for i := 1 to size - 1 do
      if arr[i] > arr[maxIdx] then maxIdx := i;
    if maxIdx <> size - 1 then begin
      if maxIdx <> 0 then Flip(maxIdx);
      Flip(size - 1);
    end;
  end;
  for i := 0 to n - 1 do Write(arr[i], ' ');
  Writeln;
end.
