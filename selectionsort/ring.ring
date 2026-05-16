func selectionSort arr
    n = len(arr)
    for i = 1 to n - 1
        minIdx = i
        for j = i + 1 to n
            if arr[j] < arr[minIdx]
                minIdx = j
            ok
        next
        tmp = arr[i]
        arr[i] = arr[minIdx]
        arr[minIdx] = tmp
    next
    return arr
