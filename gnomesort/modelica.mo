model GnomeSort
    parameter Integer n = 10;
    parameter Integer data[n] = {5, 3, 8, 1, 9, 2, 7, 4, 6, 0};

    function sort
        input Integer lst[:];
        output Integer result[size(lst, 1)];
    protected
        Integer arr[size(lst, 1)];
        Integer i, tmp, n2;
    algorithm
        arr := lst;
        n2 := size(lst, 1);
        i := 1;
        while i <= n2 loop
            if i == 1 or arr[i] >= arr[i-1] then
                i := i + 1;
            else
                tmp := arr[i];
                arr[i] := arr[i-1];
                arr[i-1] := tmp;
                i := i - 1;
            end if;
        end while;
        result := arr;
    end sort;

    Integer sorted[n];
equation
    sorted = sort(data);
end GnomeSort;
