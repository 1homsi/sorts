selectionSort = method()
selectionSort List := L -> (
    n := #L;
    arr := new MutableList from L;
    for i from 0 to n-2 do (
        minIdx := i;
        for j from i+1 to n-1 do (
            if arr#j < arr#minIdx then minIdx = j
        );
        tmp := arr#i;
        arr#i = arr#minIdx;
        arr#minIdx = tmp
    );
    toList arr
)

selectionSort {5, 3, 1, 4, 2}
