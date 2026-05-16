program Quicksort;

{$APPTYPE CONSOLE}

uses SysUtils;

type
  TIntArray = array of Integer;

procedure Quicksort(var Arr: TIntArray; Low, High: Integer);
var
  Pivot, Tmp, I, J: Integer;
begin
  if Low < High then begin
    Pivot := Arr[High];
    I := Low;
    for J := Low to High - 1 do begin
      if Arr[J] <= Pivot then begin
        Tmp := Arr[I]; Arr[I] := Arr[J]; Arr[J] := Tmp;
        Inc(I);
      end;
    end;
    Tmp := Arr[I]; Arr[I] := Arr[High]; Arr[High] := Tmp;
    Quicksort(Arr, Low, I - 1);
    Quicksort(Arr, I + 1, High);
  end;
end;

var
  Arr: TIntArray;
  I: Integer;
begin
  Arr := TIntArray.Create(3, 6, 8, 10, 1, 2, 1);
  Quicksort(Arr, 0, Length(Arr) - 1);
  for I := 0 to High(Arr) do Write(IntToStr(Arr[I]) + ' ');
  Writeln;
end.
