program CombSort;

{$APPTYPE CONSOLE}

uses SysUtils;

procedure CombSortArr(var Arr: array of Integer);
var
  N, Gap, I, Tmp: Integer;
  Sorted: Boolean;
begin
  N := Length(Arr);
  Gap := N;
  Sorted := False;
  while not Sorted do
  begin
    Gap := Trunc(Gap / 1.3);
    if Gap < 1 then Gap := 1;
    if Gap = 1 then Sorted := True;
    for I := 0 to N - Gap - 1 do
    begin
      if Arr[I] > Arr[I + Gap] then
      begin
        Tmp := Arr[I];
        Arr[I] := Arr[I + Gap];
        Arr[I + Gap] := Tmp;
        Sorted := False;
      end;
    end;
  end;
end;

begin
end.
