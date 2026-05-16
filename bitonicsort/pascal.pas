program BitonicSort;

type
  TIntArray = array of Integer;

procedure CompareAndSwap(var arr: TIntArray; i, j: Integer; direction: Boolean);
var tmp: Integer;
begin
  if direction = (arr[i] > arr[j]) then
  begin
    tmp := arr[i]; arr[i] := arr[j]; arr[j] := tmp;
  end;
end;

procedure BitonicMerge(var arr: TIntArray; lo, cnt: Integer; direction: Boolean);
var k, i: Integer;
begin
  if cnt > 1 then
  begin
    k := cnt div 2;
    for i := lo to lo + k - 1 do
      CompareAndSwap(arr, i, i + k, direction);
    BitonicMerge(arr, lo, k, direction);
    BitonicMerge(arr, lo + k, k, direction);
  end;
end;

procedure BitonicSort(var arr: TIntArray; lo, cnt: Integer; direction: Boolean);
var k: Integer;
begin
  if cnt > 1 then
  begin
    k := cnt div 2;
    BitonicSort(arr, lo, k, True);
    BitonicSort(arr, lo + k, k, False);
    BitonicMerge(arr, lo, cnt, direction);
  end;
end;

var
  data: TIntArray;
  i: Integer;
begin
  SetLength(data, 8);
  data[0] := 3; data[1] := 7; data[2] := 4; data[3] := 8;
  data[4] := 6; data[5] := 2; data[6] := 1; data[7] := 5;
  BitonicSort(data, 0, Length(data), True);
  for i := 0 to Length(data) - 1 do
    Write(data[i], ' ');
  Writeln;
end.
