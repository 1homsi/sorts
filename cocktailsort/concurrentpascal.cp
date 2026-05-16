type sortrecord = record
  arr: array [0..5] of integer
end;

process sort_process(var rec: sortrecord);
var i, k, temp, n: integer;
    swapped: boolean;
begin
  n := 6;
  i := 0;
  while i < n do
  begin
    swapped := false;
    for k := 0 to n - i - 2 do
    begin
      if rec.arr[k] > rec.arr[k + 1] then
      begin
        temp := rec.arr[k];
        rec.arr[k] := rec.arr[k + 1];
        rec.arr[k + 1] := temp;
        swapped := true;
      end;
    end;
    if not swapped then goto done;
    i := i + 1;
  end;
  done:
end;
