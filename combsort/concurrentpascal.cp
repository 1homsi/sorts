program comb_sort;
var
  arr: array [1..6] of integer;
  gap, i, temp: integer;
  swapped: boolean;
process type sorter;
begin
  gap := 6;
  swapped := true;
  while gap > 1 or swapped do
  begin
    gap := (gap * 10) div 13;
    if gap < 1 then
      gap := 1;
    swapped := false;
    for i := 1 to 6 - gap do
    begin
      if arr[i] > arr[i + gap] then
      begin
        temp := arr[i];
        arr[i] := arr[i + gap];
        arr[i + gap] := temp;
        swapped := true;
      end;
    end;
  end;
end;
begin
  arr[1] := 5;
  arr[2] := 2;
  arr[3] := 8;
  arr[4] := 1;
  arr[5] := 9;
  arr[6] := 3;
end.
