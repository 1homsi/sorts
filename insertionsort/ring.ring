func insertionSort arr
    n = len(arr)
    for i = 2 to n
        key = arr[i]
        j = i - 1
        while j >= 1 and arr[j] > key
            arr[j+1] = arr[j]
            j -= 1
        end
        arr[j+1] = key
    next
    return arr
