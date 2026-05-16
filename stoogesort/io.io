stoogeSort := method(arr, first, last,
    if(arr at(first) > arr at(last),
        tmp := arr at(first)
        arr atPut(first, arr at(last))
        arr atPut(last, tmp)
    )
    n := last - first + 1
    if(n > 2,
        t := (n * 2) / 3 floor
        stoogeSort(arr, first, first + t - 1)
        stoogeSort(arr, last - t + 1, last)
        stoogeSort(arr, first, first + t - 1)
    )
)

arr := list(3, 1, 4, 1, 5, 9, 2, 6)
stoogeSort(arr, 0, arr size - 1)
arr println
