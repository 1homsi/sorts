program GnomeSort;

uses SysUtils;

type
  TIntArray = array of Integer;

procedure GnomeSortProc(var Arr: TIntArray);
var
  I, Temp: Integer;
begin
  I := 0;
  while I < Length(Arr) do
  begin
    if (I = 0) or (Arr[I] >= Arr[I - 1]) then
      Inc(I)
    else
    begin
      Temp := Arr[I];
      Arr[I] := Arr[I - 1];
      Arr[I - 1] := Temp;
      Dec(I);
    end;
  end;
end;

begin
end.
