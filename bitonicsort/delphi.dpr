program BitonicSort;

{$APPTYPE CONSOLE}

uses SysUtils;

type
  TIntArray = array of Integer;

procedure CompareAndSwap(var Arr: TIntArray; I, J: Integer; Direction: Boolean);
var Tmp: Integer;
begin
  if Direction = (Arr[I] > Arr[J]) then
  begin
    Tmp := Arr[I]; Arr[I] := Arr[J]; Arr[J] := Tmp;
  end;
end;

procedure BitonicMerge(var Arr: TIntArray; Lo, Cnt: Integer; Direction: Boolean);
var K, I: Integer;
begin
  if Cnt > 1 then
  begin
    K := Cnt div 2;
    for I := Lo to Lo + K - 1 do
      CompareAndSwap(Arr, I, I + K, Direction);
    BitonicMerge(Arr, Lo, K, Direction);
    BitonicMerge(Arr, Lo + K, K, Direction);
  end;
end;

procedure BitonicSort(var Arr: TIntArray; Lo, Cnt: Integer; Direction: Boolean);
var K: Integer;
begin
  if Cnt > 1 then
  begin
    K := Cnt div 2;
    BitonicSort(Arr, Lo, K, True);
    BitonicSort(Arr, Lo + K, K, False);
    BitonicMerge(Arr, Lo, Cnt, Direction);
  end;
end;

var
  Data: TIntArray;
  I: Integer;
begin
  SetLength(Data, 8);
  Data[0] := 3; Data[1] := 7; Data[2] := 4; Data[3] := 8;
  Data[4] := 6; Data[5] := 2; Data[6] := 1; Data[7] := 5;
  BitonicSort(Data, 0, Length(Data), True);
  for I := 0 to Length(Data) - 1 do
    Write(Data[I], ' ');
  Writeln;
end.
