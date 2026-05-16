bubbleSort := method(arr,
    n := arr size
    swapped := true
    while(swapped,
        swapped = false
        for(i, 0, n - 2,
            if(arr at(i) > arr at(i + 1),
                tmp := arr at(i)
                arr atPut(i, arr at(i + 1))
                arr atPut(i + 1, tmp)
                swapped = true
            )
        )
        n = n - 1
    )
    arr
)

arr := list(64, 34, 25, 12, 22, 11, 90)
bubbleSort(arr) println
