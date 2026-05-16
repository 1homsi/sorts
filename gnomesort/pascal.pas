program GnomeSort;

type
  TArray = array of Integer;

procedure GnomeSortProc(var arr: TArray);
var
  i, temp: Integer;
begin
  i := 0;
  while i < Length(arr) do
  begin
    if (i = 0) or (arr[i] >= arr[i - 1]) then
      Inc(i)
    else
    begin
      temp := arr[i];
      arr[i] := arr[i - 1];
      arr[i - 1] := temp;
      Dec(i);
    end;
  end;
end;

begin
end.
