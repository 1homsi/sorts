func cocktailSort arr
    swapped = true
    start = 1
    ending = len(arr)
    while swapped
        swapped = false
        for i = start to ending - 1
            if arr[i] > arr[i + 1]
                tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = true
            ok
        next
        if not swapped
            exit
        ok
        swapped = false
        ending -= 1
        for i = ending - 1 to start step -1
            if arr[i] > arr[i + 1]
                tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = true
            ok
        next
        start += 1
    end
    return arr
