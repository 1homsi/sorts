program BubbleSort;

{$APPTYPE CONSOLE}

uses SysUtils;

procedure BSort(var Arr: array of Integer);
var
  N, I, Tmp: Integer;
  Swapped: Boolean;
begin
  N := Length(Arr);
  repeat
    Swapped := False;
    for I := 0 to N - 2 do
    begin
      if Arr[I] > Arr[I + 1] then
      begin
        Tmp := Arr[I];
        Arr[I] := Arr[I + 1];
        Arr[I + 1] := Tmp;
        Swapped := True;
      end;
    end;
    Dec(N);
  until not Swapped;
end;

var
  Arr: array of Integer;
  I: Integer;
begin
  Arr := TArray<Integer>.Create(64, 34, 25, 12, 22, 11, 90);
  BSort(Arr);
  for I := 0 to High(Arr) do
    Write(Arr[I], ' ');
  Writeln;
end.
