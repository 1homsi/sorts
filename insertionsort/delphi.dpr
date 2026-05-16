program InsertionSortDemo;

procedure InsertionSort(var Arr: array of Integer);
var
  i, j, Key: Integer;
begin
  for i := 1 to High(Arr) do
  begin
    Key := Arr[i];
    j := i - 1;
    while (j >= 0) and (Arr[j] > Key) do
    begin
      Arr[j + 1] := Arr[j];
      Dec(j);
    end;
    Arr[j + 1] := Key;
  end;
end;

begin
end.
