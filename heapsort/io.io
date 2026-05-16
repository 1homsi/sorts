Heapsort := Object clone

Heapsort heapify := method(arr, n, i,
    largest := i
    left := 2 * i + 1
    right := 2 * i + 2
    if(left < n and(arr at(left) > arr at(largest)), largest = left)
    if(right < n and(arr at(right) > arr at(largest)), largest = right)
    if(largest != i,
        tmp := arr at(i)
        arr atPut(i, arr at(largest))
        arr atPut(largest, tmp)
        heapify(arr, n, largest)
    )
)

Heapsort sort := method(arr,
    n := arr size
    i := n / 2 - 1
    while(i >= 0,
        heapify(arr, n, i)
        i = i - 1
    )
    i = n - 1
    while(i > 0,
        tmp := arr at(0)
        arr atPut(0, arr at(i))
        arr atPut(i, tmp)
        heapify(arr, i, 0)
        i = i - 1
    )
    arr
)

arr := list(12, 11, 13, 5, 6, 7)
Heapsort sort(arr) println
