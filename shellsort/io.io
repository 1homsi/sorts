shellSort := method(arr,
    n := arr size
    gap := (n / 2) floor
    while(gap > 0,
        gap to(n - 1) foreach(i,
            temp := arr at(i)
            j := i
            while(j >= gap and(arr at(j - gap) > temp),
                arr atPut(j, arr at(j - gap))
                j = j - gap
            )
            arr atPut(j, temp)
        )
        gap = (gap / 2) floor
    )
    arr
)

arr := list(64, 34, 25, 12, 22, 11, 90)
shellSort(arr) println
