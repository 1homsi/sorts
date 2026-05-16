program Delphi;

{$APPTYPE CONSOLE}

uses SysUtils;

type
  TIntArray = array of Integer;

procedure CountingSort(var Arr: TIntArray; Exp: Integer);
var
  N, I, Idx: Integer;
  Output: TIntArray;
  Count: array[0..9] of Integer;
begin
  N := Length(Arr);
  SetLength(Output, N);
  FillChar(Count, SizeOf(Count), 0);
  for I := 0 to N-1 do
  begin
    Idx := (Arr[I] div Exp) mod 10;
    Inc(Count[Idx]);
  end;
  for I := 1 to 9 do Count[I] := Count[I] + Count[I-1];
  for I := N-1 downto 0 do
  begin
    Idx := (Arr[I] div Exp) mod 10;
    Dec(Count[Idx]);
    Output[Count[Idx]] := Arr[I];
  end;
  for I := 0 to N-1 do Arr[I] := Output[I];
end;

procedure RadixSort(var Arr: TIntArray);
var
  Max, Exp, I: Integer;
begin
  if Length(Arr) = 0 then Exit;
  Max := Arr[0];
  for I := 1 to Length(Arr)-1 do
    if Arr[I] > Max then Max := Arr[I];
  Exp := 1;
  while Max div Exp > 0 do
  begin
    CountingSort(Arr, Exp);
    Exp := Exp * 10;
  end;
end;

var
  Arr: TIntArray;
  I: Integer;
begin
  Arr := TIntArray.Create(170, 45, 75, 90, 802, 24, 2, 66);
  RadixSort(Arr);
  for I := 0 to Length(Arr)-1 do Write(Arr[I], ' ');
  WriteLn;
end.
