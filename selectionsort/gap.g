SelectionSort := function(arr)
    local n, i, j, minIdx, tmp;
    n := Length(arr);
    for i in [1..n-1] do
        minIdx := i;
        for j in [i+1..n] do
            if arr[j] < arr[minIdx] then
                minIdx := j;
            fi;
        od;
        tmp := arr[i];
        arr[i] := arr[minIdx];
        arr[minIdx] := tmp;
    od;
    return arr;
end;

Print(SelectionSort([5,3,1,4,2]), "\n");
