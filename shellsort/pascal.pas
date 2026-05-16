procedure Shellsort(var arr: array of Integer; n: Integer);
var
  gap, i, j, temp: Integer;
begin
  gap := n div 2;
  while gap > 0 do
  begin
    for i := gap to n - 1 do
    begin
      temp := arr[i];
      j := i;
      while (j >= gap) and (arr[j - gap] > temp) do
      begin
        arr[j] := arr[j - gap];
        j := j - gap;
      end;
      arr[j] := temp;
    end;
    gap := gap div 2;
  end;
end;
