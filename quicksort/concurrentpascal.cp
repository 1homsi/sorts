program Quicksort;

type
  IntArray = array [1..6] of integer;

procedure Sort(var arr: IntArray; n: integer);
var
  i, j, pivot, temp: integer;
begin
  if n <= 1 then exit;

  pivot := arr[1];
  i := 1;
  j := n;

  while i < j do
  begin
    while arr[i] < pivot do i := i + 1;
    while arr[j] > pivot do j := j - 1;

    if i < j then
    begin
      temp := arr[i];
      arr[i] := arr[j];
      arr[j] := temp;
      i := i + 1;
      j := j - 1;
    end;
  end;
end;

var
  arr: IntArray;
  i: integer;

begin
  arr[1] := 5; arr[2] := 2; arr[3] := 8;
  arr[4] := 1; arr[5] := 9; arr[6] := 3;

  Sort(arr, 6);

  for i := 1 to 6 do
    writeln(arr[i]);
end.