program QuicksortDemo;

type
  TArr = array[0..6] of Integer;

procedure Quicksort(var arr: TArr; low, high: Integer);
var
  pivot, tmp, i, j: Integer;
begin
  if low < high then begin
    pivot := arr[high];
    i := low;
    for j := low to high - 1 do begin
      if arr[j] <= pivot then begin
        tmp := arr[i]; arr[i] := arr[j]; arr[j] := tmp;
        Inc(i);
      end;
    end;
    tmp := arr[i]; arr[i] := arr[high]; arr[high] := tmp;
    Quicksort(arr, low, i - 1);
    Quicksort(arr, i + 1, high);
  end;
end;

var
  arr: TArr = (3, 6, 8, 10, 1, 2, 1);
  i: Integer;
begin
  Quicksort(arr, 0, 6);
  for i := 0 to 6 do Write(arr[i], ' ');
  Writeln;
end.
