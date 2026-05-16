local gnomeSort(arr) =
    local n = std.length(arr);
    local loop(a, i) =
        if i >= n then a
        else if i == 0 || a[i] >= a[i - 1] then loop(a, i + 1)
        else
            local x = a[i];
            local y = a[i - 1];
            local a2 = [
                if j == i then y
                else if j == i - 1 then x
                else a[j]
                for j in std.range(0, n - 1)
            ];
            loop(a2, i - 1);
    loop(arr, 0);

gnomeSort([5, 3, 8, 1, 9, 2, 7, 4, 6, 0])
