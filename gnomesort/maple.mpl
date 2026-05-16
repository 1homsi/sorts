gnomeSort := proc(lst::list)
    local arr, n, i, tmp;
    arr := convert(lst, Array);
    n := numelems(arr);
    i := 1;
    while i <= n do
        if i = 1 or arr[i] >= arr[i-1] then
            i := i + 1;
        else
            tmp := arr[i];
            arr[i] := arr[i-1];
            arr[i-1] := tmp;
            i := i - 1;
        end if;
    end do;
    convert(arr, list);
end proc;

gnomeSort([5, 3, 8, 1, 9, 2, 7, 4, 6, 0]);
