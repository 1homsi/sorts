procedure InsertionSort(var arr: array of Integer; n: Integer);
var
  i, j, key: Integer;
begin
  for i := 1 to n - 1 do
  begin
    key := arr[i];
    j := i - 1;
    while (j >= 0) and (arr[j] > key) do
    begin
      arr[j + 1] := arr[j];
      Dec(j);
    end;
    arr[j + 1] := key;
  end;
end;
