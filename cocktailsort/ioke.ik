cocktailSort = method(arr,
    swapped = true
    start = 0
    end = arr length - 1
    while(swapped,
        swapped = false
        for(i, start, end - 1,
            if(arr[i] > arr[i + 1],
                tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = true
            )
        )
        unless(swapped, return(arr))
        swapped = false
        end = end - 1
        i = end - 1
        while(i >= start,
            if(arr[i] > arr[i + 1],
                tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = true
            )
            i = i - 1
        )
        start = start + 1
    )
    arr
)
