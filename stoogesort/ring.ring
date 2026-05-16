arr = [3, 1, 4, 1, 5, 9, 2, 6]
stoogeSort(arr, 1, len(arr))

func stoogeSort arr, first, last
    if arr[first] > arr[last]
        tmp = arr[first]
        arr[first] = arr[last]
        arr[last] = tmp
    ok
    n = last - first + 1
    if n > 2
        t = floor(n * 2 / 3)
        stoogeSort(arr, first, first + t - 1)
        stoogeSort(arr, last - t + 1, last)
        stoogeSort(arr, first, first + t - 1)
    ok
    return arr

see arr
