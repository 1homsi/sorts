define gnome-sort(arr :: <array>, n :: <integer>) => <array>
    let i = 0;
    while (i < n) {
        if (i = 0 | arr[i] >= arr[i - 1]) then
            i := i + 1
        else {
            let tmp = arr[i];
            arr[i] := arr[i - 1];
            arr[i - 1] := tmp;
            i := i - 1
        }
    };
    arr
end
