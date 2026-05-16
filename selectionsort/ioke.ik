selectionSort = method(arr,
    n = arr length
    i = 0
    while(i < n,
        minIdx = i
        j = i + 1
        while(j < n,
            if(arr[j] < arr[minIdx], minIdx = j)
            j = j + 1
        )
        tmp = arr[i]
        arr[i] = arr[minIdx]
        arr[minIdx] = tmp
        i = i + 1
    )
    arr
)
