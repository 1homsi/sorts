program CountingSort;
var
  arr: array[1..7] of integer = (4, 2, 2, 8, 3, 3, 1);
  count: array[0..100] of integer;
  output: array[1..7] of integer;
  i, n, mn, mx, rng, idx: integer;
begin
  n := 7;
  mn := arr[1]; mx := arr[1];
  for i := 1 to n do begin
    if arr[i] < mn then mn := arr[i];
    if arr[i] > mx then mx := arr[i];
  end;
  rng := mx - mn + 1;
  for i := 0 to rng - 1 do count[i] := 0;
  for i := 1 to n do count[arr[i] - mn] := count[arr[i] - mn] + 1;
  for i := 1 to rng - 1 do count[i] := count[i] + count[i - 1];
  for i := n downto 1 do begin
    idx := arr[i] - mn;
    count[idx] := count[idx] - 1;
    output[count[idx] + 1] := arr[i];
  end;
  for i := 1 to n do write(output[i], ' ');
  writeln;
end.
