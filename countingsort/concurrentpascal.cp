program CountingSort;
type intarray = array[0..9] of integer;

procedure countingsort(var arr: intarray; var output: intarray);
var max, i, j, count: intarray;
var idx: integer;
begin
  max := 0;
  for i := 0 to 5 do
    if arr[i] > max then
      max := arr[i];

  for i := 0 to 9 do
    count[i] := 0;

  for i := 0 to 5 do
    count[arr[i]] := count[arr[i]] + 1;

  idx := 0;
  for i := 0 to max do
    for j := 1 to count[i] do
      output[idx] := i;
      idx := idx + 1;
end;

var arr, output: intarray;
begin
  arr[0] := 5;
  arr[1] := 2;
  arr[2] := 8;
  arr[3] := 1;
  arr[4] := 9;
  arr[5] := 3;

  countingsort(arr, output);

  for i := 0 to 5 do
    write(output[i], ' ');

end.
