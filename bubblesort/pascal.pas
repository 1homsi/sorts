program BubbleSort;

var
  arr: array[1..7] of integer = (64, 34, 25, 12, 22, 11, 90);
  n, i, tmp: integer;
  swapped: boolean;

begin
  n := 7;
  repeat
    swapped := false;
    for i := 1 to n - 1 do
    begin
      if arr[i] > arr[i + 1] then
      begin
        tmp := arr[i];
        arr[i] := arr[i + 1];
        arr[i + 1] := tmp;
        swapped := true;
      end;
    end;
    dec(n);
  until not swapped;

  for i := 1 to 7 do
    write(arr[i], ' ');
  writeln;
end.
