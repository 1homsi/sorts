selectionSort := proc(arr)
    local n, i, j, minIdx, tmp, result;
    result := [op(arr)];
    n := nops(result);
    for i from 1 to n-1 do
        minIdx := i;
        for j from i+1 to n do
            if result[j] < result[minIdx] then
                minIdx := j
            end if
        end do;
        tmp := result[i];
        result[i] := result[minIdx];
        result[minIdx] := tmp
    end do;
    result
end proc;

selectionSort([5, 3, 1, 4, 2]);
