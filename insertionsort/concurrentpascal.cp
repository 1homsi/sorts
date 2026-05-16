var arr: packed array [1..6] of integer;
var n, i, j, key: integer;

begin
  arr[1] := 5; arr[2] := 2; arr[3] := 8; arr[4] := 1; arr[5] := 9; arr[6] := 3;
  n := 6;
  for i := 2 to n do
  begin
    key := arr[i];
    j := i - 1;
    while (j > 0) and (arr[j] > key) do
    begin
      arr[j+1] := arr[j];
      j := j - 1
    end;
    arr[j+1] := key
  end;
  for i := 1 to n do write(arr[i]);
end.