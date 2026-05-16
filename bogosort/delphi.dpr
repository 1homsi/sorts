program Bogosort;
{$APPTYPE CONSOLE}
uses SysUtils;

var
  arr: array[0..7] of Integer = (3, 1, 4, 1, 5, 9, 2, 6);
  n: Integer = 8;

function IsSorted: Boolean;
var i: Integer;
begin
  Result := True;
  for i := 0 to n - 2 do
    if arr[i] > arr[i + 1] then
    begin
      Result := False;
      Exit;
    end;
end;

procedure Shuffle;
var i, j, tmp: Integer;
begin
  for i := n - 1 downto 1 do
  begin
    j := Random(i + 1);
    tmp := arr[i];
    arr[i] := arr[j];
    arr[j] := tmp;
  end;
end;

var i: Integer;
begin
  Randomize;
  while not IsSorted do
    Shuffle;
  for i := 0 to n - 1 do
    Write(arr[i], ' ');
  Writeln;
end.
