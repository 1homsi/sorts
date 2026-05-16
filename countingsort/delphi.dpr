program CountingSort;
{$APPTYPE CONSOLE}
uses SysUtils;

procedure Sort(var Arr: array of Integer);
var
  i, n, mn, mx, rng, idx: Integer;
  Count, Output: array of Integer;
begin
  n := Length(Arr);
  if n = 0 then Exit;
  mn := Arr[0]; mx := Arr[0];
  for i := 0 to n - 1 do begin
    if Arr[i] < mn then mn := Arr[i];
    if Arr[i] > mx then mx := Arr[i];
  end;
  rng := mx - mn + 1;
  SetLength(Count, rng); SetLength(Output, n);
  for i := 0 to rng - 1 do Count[i] := 0;
  for i := 0 to n - 1 do Inc(Count[Arr[i] - mn]);
  for i := 1 to rng - 1 do Count[i] := Count[i] + Count[i - 1];
  for i := n - 1 downto 0 do begin
    Dec(Count[Arr[i] - mn]);
    Output[Count[Arr[i] - mn]] := Arr[i];
  end;
  for i := 0 to n - 1 do Arr[i] := Output[i];
end;

var
  Arr: array of Integer;
  i: Integer;
begin
  Arr := [4, 2, 2, 8, 3, 3, 1];
  Sort(Arr);
  for i := 0 to Length(Arr) - 1 do Write(Arr[i], ' ');
  Writeln;
end.
