GnomeSort := function(lst)
    local arr, n, i, tmp;
    arr := ShallowCopy(lst);
    n := Length(arr);
    i := 1;
    while i <= n do
        if i = 1 or arr[i] >= arr[i-1] then
            i := i + 1;
        else
            tmp := arr[i];
            arr[i] := arr[i-1];
            arr[i-1] := tmp;
            i := i - 1;
        fi;
    od;
    return arr;
end;

GnomeSort([5, 3, 8, 1, 9, 2, 7, 4, 6, 0]);
