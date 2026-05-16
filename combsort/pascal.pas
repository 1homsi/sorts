program CombSort;

var
  arr: array[1..100] of Integer;
  n, gap, i, tmp: Integer;
  sorted: Boolean;

procedure Sort;
begin
  gap := n;
  sorted := False;
  while not sorted do
  begin
    gap := Trunc(gap / 1.3);
    if gap < 1 then gap := 1;
    if gap = 1 then sorted := True;
    for i := 1 to n - gap do
    begin
      if arr[i] > arr[i + gap] then
      begin
        tmp := arr[i];
        arr[i] := arr[i + gap];
        arr[i + gap] := tmp;
        sorted := False;
      end;
    end;
  end;
end;

begin
  n := 0;
end.
