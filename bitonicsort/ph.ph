module BitonicSort;

procedure compareAndSwap(arr: array of int; i, j: int; dir: bool);
var tmp: int;
begin
    if dir = (arr[i] > arr[j]) then
        tmp := arr[i]; arr[i] := arr[j]; arr[j] := tmp
    end
end;

procedure bitonicMerge(arr: array of int; lo, cnt: int; dir: bool);
var k, i: int;
begin
    if cnt > 1 then
        k := cnt div 2;
        for i := lo to lo + k - 1 do
            compareAndSwap(arr, i, i + k, dir)
        end;
        bitonicMerge(arr, lo, k, dir);
        bitonicMerge(arr, lo + k, k, dir)
    end
end;

procedure bitonicSort(arr: array of int; lo, cnt: int; dir: bool);
var k: int;
begin
    if cnt > 1 then
        k := cnt div 2;
        bitonicSort(arr, lo, k, true);
        bitonicSort(arr, lo + k, k, false);
        bitonicMerge(arr, lo, cnt, dir)
    end
end;

var data: array[8] of int := {3,7,4,8,6,2,1,5};
begin
    bitonicSort(data, 0, 8, true);
    for i := 0 to 7 do print(data[i], " ") end;
    println
end.
