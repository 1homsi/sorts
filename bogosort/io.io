isSorted := method(arr,
    for(i, 0, arr size - 2,
        if(arr at(i) > arr at(i + 1), return false)
    )
    true
)

shuffle := method(arr,
    n := arr size
    for(i, n - 1, 1, -1,
        j := (Random value * (i + 1)) floor
        tmp := arr at(i)
        arr atPut(i, arr at(j))
        arr atPut(j, tmp)
    )
    arr
)

bogosort := method(arr,
    while(isSorted(arr) not, shuffle(arr))
    arr
)

arr := list(3, 1, 4, 1, 5, 9, 2, 6)
bogosort(arr) println
