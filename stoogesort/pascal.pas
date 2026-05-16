program StoogeSort;

var
    arr: array[0..7] of integer = (3, 1, 4, 1, 5, 9, 2, 6);

procedure stoogeSort(var a: array of integer; first, last: integer);
var
    tmp, t: integer;
begin
    if a[first] > a[last] then begin
        tmp := a[first];
        a[first] := a[last];
        a[last] := tmp;
    end;
    if last - first + 1 > 2 then begin
        t := (last - first + 1) * 2 div 3;
        stoogeSort(a, first, first + t - 1);
        stoogeSort(a, last - t + 1, last);
        stoogeSort(a, first, first + t - 1);
    end;
end;

var i: integer;
begin
    stoogeSort(arr, 0, 7);
    for i := 0 to 7 do write(arr[i], ' ');
    writeln;
end.
