program ShellSort;
{$APPTYPE CONSOLE}
uses SysUtils;

procedure ShellSortArr(var arr: array of Integer);
var
  n, gap, i, j, temp: Integer;
begin
  n := Length(arr);
  gap := n div 2;
  while gap > 0 do begin
    for i := gap to n - 1 do begin
      temp := arr[i];
      j := i;
      while (j >= gap) and (arr[j - gap] > temp) do begin
        arr[j] := arr[j - gap];
        Dec(j, gap);
      end;
      arr[j] := temp;
    end;
    gap := gap div 2;
  end;
end;

var
  arr: array of Integer;
  i: Integer;
begin
  arr := [64, 34, 25, 12, 22, 11, 90];
  ShellSortArr(arr);
  for i := 0 to High(arr) do Write(arr[i], ' ');
  Writeln;
end.
