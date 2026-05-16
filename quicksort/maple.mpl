quicksort := proc(arr, low, high)
    local pivot, i, j, tmp, p;
    if low < high then
        pivot := arr[high];
        i := low;
        for j from low to high-1 do
            if arr[j] <= pivot then
                tmp := arr[i]; arr[i] := arr[j]; arr[j] := tmp;
                i := i+1;
            end if;
        end do;
        tmp := arr[i]; arr[i] := arr[high]; arr[high] := tmp;
        p := i;
        quicksort(arr, low, p-1);
        quicksort(arr, p+1, high);
    end if;
end proc:

arr := Array([3, 6, 8, 10, 1, 2, 1]):
quicksort(arr, 1, 7):
print(arr);
