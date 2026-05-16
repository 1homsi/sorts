func partition arr, low, high
    pivot = arr[high]
    i = low
    for j = low to high - 1
        if arr[j] <= pivot
            tmp = arr[i]
            arr[i] = arr[j]
            arr[j] = tmp
            i = i + 1
        ok
    next
    tmp = arr[i]
    arr[i] = arr[high]
    arr[high] = tmp
    return i

func quicksort arr, low, high
    if low < high
        p = partition(arr, low, high)
        quicksort(arr, low, p - 1)
        quicksort(arr, p + 1, high)
    ok

arr = [3, 6, 8, 10, 1, 2, 1]
quicksort(arr, 1, len(arr))
see arr
