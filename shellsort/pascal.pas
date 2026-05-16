program ShellSort;
var
  arr: array[0..6] of integer = (64, 34, 25, 12, 22, 11, 90);
  n, gap, i, j, temp: integer;
begin
  n := 7;
  gap := n div 2;
  while gap > 0 do begin
    for i := gap to n - 1 do begin
      temp := arr[i];
      j := i;
      while (j >= gap) and (arr[j - gap] > temp) do begin
        arr[j] := arr[j - gap];
        j := j - gap;
      end;
      arr[j] := temp;
    end;
    gap := gap div 2;
  end;
  for i := 0 to n - 1 do write(arr[i], ' ');
  writeln;
end.
