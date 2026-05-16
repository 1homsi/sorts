isSorted = method(arr,
    n = arr length
    (0...(n-1)) each(i,
        if(arr[i] > arr[i + 1], return false)
    )
    true
)

shuffle = method(arr,
    n = arr length
    (n - 1)...1 each(i,
        j = (n * random) floor
        tmp = arr[i]
        arr[i] = arr[j]
        arr[j] = tmp
    )
    arr
)

bogosort = method(arr,
    while(!(isSorted(arr)), shuffle(arr))
    arr
)

arr = [3, 1, 4, 1, 5, 9, 2, 6]
bogosort(arr) println
