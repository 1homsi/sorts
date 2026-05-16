func bubbleSort arr
    n = len(arr)
    swapped = true
    while swapped
        swapped = false
        for i = 1 to n - 1
            if arr[i] > arr[i + 1]
                tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = true
            ok
        next
        n--
    end
    return arr

arr = [64, 34, 25, 12, 22, 11, 90]
arr = bubbleSort(arr)
see arr
