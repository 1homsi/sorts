program CocktailSort;

type
  TIntArray = array of Integer;

procedure CocktailSortArr(var arr: TIntArray);
var
  swapped: Boolean;
  start, ending, i, tmp: Integer;
begin
  swapped := True;
  start := 0;
  ending := Length(arr) - 1;
  while swapped do
  begin
    swapped := False;
    for i := start to ending - 1 do
    begin
      if arr[i] > arr[i + 1] then
      begin
        tmp := arr[i];
        arr[i] := arr[i + 1];
        arr[i + 1] := tmp;
        swapped := True;
      end;
    end;
    if not swapped then Break;
    swapped := False;
    Dec(ending);
    for i := ending - 1 downto start do
    begin
      if arr[i] > arr[i + 1] then
      begin
        tmp := arr[i];
        arr[i] := arr[i + 1];
        arr[i + 1] := tmp;
        swapped := True;
      end;
    end;
    Inc(start);
  end;
end;

begin
end.
