insertionSort := method(arr,
    n := arr size
    1 to: n - 1 do(i,
        key := arr at(i)
        j := i - 1
        while(j >= 0 and(arr at(j) > key),
            arr atPut(j + 1, arr at(j))
            j = j - 1
        )
        arr atPut(j + 1, key)
    )
    arr
)
