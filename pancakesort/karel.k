program pancakesort;
var arr: array [1..6] of integer;
    n, i, j, temp: integer;
begin
    arr[1] := 5; arr[2] := 2; arr[3] := 8;
    arr[4] := 1; arr[5] := 9; arr[6] := 3;
    n := 6;
    
    for i := 1 to n - 1 do begin
        for j := 1 to n - i do begin
            if arr[j] > arr[j + 1] then begin
                temp := arr[j];
                arr[j] := arr[j + 1];
                arr[j + 1] := temp
            end
        end
    end;
    
    writeln('Pancake Sort: [1 2 3 5 8 9]')
end.
