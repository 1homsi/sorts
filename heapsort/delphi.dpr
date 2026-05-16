program delphi;

{$APPTYPE CONSOLE}

uses SysUtils;

type TIntArr = array of Integer;

procedure Heapify(var Arr: TIntArr; N, I: Integer);
var
  Largest, Left, Right, Tmp: Integer;
begin
  Largest := I; Left := 2*I+1; Right := 2*I+2;
  if (Left < N) and (Arr[Left] > Arr[Largest]) then Largest := Left;
  if (Right < N) and (Arr[Right] > Arr[Largest]) then Largest := Right;
  if Largest <> I then
  begin
    Tmp := Arr[I]; Arr[I] := Arr[Largest]; Arr[Largest] := Tmp;
    Heapify(Arr, N, Largest);
  end;
end;

procedure HeapSort(var Arr: TIntArr);
var N, I, Tmp: Integer;
begin
  N := Length(Arr);
  for I := N div 2 - 1 downto 0 do Heapify(Arr, N, I);
  for I := N - 1 downto 1 do
  begin
    Tmp := Arr[0]; Arr[0] := Arr[I]; Arr[I] := Tmp;
    Heapify(Arr, I, 0);
  end;
end;

var
  Arr: TIntArr;
  I: Integer;
begin
  Arr := TIntArr.Create(12, 11, 13, 5, 6, 7);
  HeapSort(Arr);
  for I := 0 to High(Arr) do Write(Arr[I], ' ');
  Writeln;
end.
