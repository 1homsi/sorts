func gnomeSort arr
    i = 1
    n = len(arr)
    while i <= n
        if i = 1 or arr[i] >= arr[i - 1]
            i = i + 1
        else
            tmp = arr[i]
            arr[i] = arr[i - 1]
            arr[i - 1] = tmp
            i = i - 1
        ok
    end
    return arr
