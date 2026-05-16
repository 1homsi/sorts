program Bogosort;
uses SysUtils;

var
  arr: array[1..8] of Integer = (3, 1, 4, 1, 5, 9, 2, 6);
  i, j, tmp, n: Integer;
  sorted: Boolean;

function IsSorted: Boolean;
var k: Integer;
begin
  IsSorted := True;
  for k := 1 to n - 1 do
    if arr[k] > arr[k + 1] then
    begin
      IsSorted := False;
      Break;
    end;
end;

procedure Shuffle;
var k, r, t: Integer;
begin
  for k := n downto 2 do
  begin
    r := Random(k) + 1;
    t := arr[k];
    arr[k] := arr[r];
    arr[r] := t;
  end;
end;

begin
  n := 8;
  Randomize;
  while not IsSorted do
    Shuffle;
  for i := 1 to n do
    Write(arr[i], ' ');
  Writeln;
end.
