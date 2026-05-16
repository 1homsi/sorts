vardef selectionSort(suffix arr)(expr n) =
    save i, j, minIdx, tmp;
    for i = 1 upto n-1:
        minIdx := i;
        for j = i+1 upto n:
            if arr[j] < arr[minIdx]: minIdx := j; fi
        endfor;
        tmp := arr[i];
        arr[i] := arr[minIdx];
        arr[minIdx] := tmp;
    endfor;
enddef;

numeric a[];
a[1]=5; a[2]=3; a[3]=1; a[4]=4; a[5]=2;
selectionSort(a, 5);
