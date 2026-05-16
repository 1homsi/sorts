gnomeSort = method()
gnomeSort List := lst -> (
    arr := new MutableList from lst;
    n := #arr;
    i := 0;
    while i < n do (
        if i == 0 or arr#i >= arr#(i-1) then (
            i = i + 1;
        ) else (
            tmp := arr#i;
            arr#i = arr#(i-1);
            arr#(i-1) = tmp;
            i = i - 1;
        );
    );
    toList arr
)

gnomeSort {5, 3, 8, 1, 9, 2, 7, 4, 6, 0}
