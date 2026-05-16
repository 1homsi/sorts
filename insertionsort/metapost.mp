vardef insertion_sort(suffix arr)(expr n) =
    save i, j, key;
    for i = 1 upto n - 1:
        key := arr[i];
        j := i - 1;
        forever:
            exitif (j < 0) or (arr[j] <= key);
            arr[j + 1] := arr[j];
            j := j - 1;
        endfor;
        arr[j + 1] := key;
    endfor;
enddef;
