program delphi;

{$APPTYPE CONSOLE}

uses SysUtils;

var
    arr: array of Integer;

procedure StoogeSort(var a: array of Integer; first, last: Integer);
var
    tmp, t: Integer;
begin
    if a[first] > a[last] then
    begin
        tmp := a[first];
        a[first] := a[last];
        a[last] := tmp;
    end;
    if last - first + 1 > 2 then
    begin
        t := (last - first + 1) * 2 div 3;
        StoogeSort(a, first, first + t - 1);
        StoogeSort(a, last - t + 1, last);
        StoogeSort(a, first, first + t - 1);
    end;
end;

var i: Integer;
begin
    SetLength(arr, 8);
    arr[0] := 3; arr[1] := 1; arr[2] := 4; arr[3] := 1;
    arr[4] := 5; arr[5] := 9; arr[6] := 2; arr[7] := 6;
    StoogeSort(arr, 0, Length(arr) - 1);
    for i := 0 to Length(arr) - 1 do Write(arr[i], ' ');
    Writeln;
end.
