selectionSort := method(arr,
    n := arr size
    for(i, 0, n - 2,
        minIdx := i
        for(j, i + 1, n - 1,
            if(arr at(j) < arr at(minIdx), minIdx = j)
        )
        tmp := arr at(i)
        arr atPut(i, arr at(minIdx))
        arr atPut(minIdx, tmp)
    )
    arr
)
