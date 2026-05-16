func countingSort arr, exp
    n = len(arr)
    output = list(n)
    count = list(10)
    for i = 1 to 10
        count[i] = 0
    next
    for i = 1 to n
        idx = floor(arr[i] / exp) % 10 + 1
        count[idx]++
    next
    for i = 2 to 10
        count[i] += count[i-1]
    next
    for i = n to 1 step -1
        idx = floor(arr[i] / exp) % 10 + 1
        count[idx]--
        output[count[idx] + 1] = arr[i]
    next
    for i = 1 to n
        arr[i] = output[i]
    next
    return arr

func radixSort arr
    if len(arr) = 0 return arr ok
    maxVal = arr[1]
    for x in arr
        if x > maxVal maxVal = x ok
    next
    exp = 1
    while floor(maxVal / exp) > 0
        arr = countingSort(arr, exp)
        exp *= 10
    end
    return arr

arr = [170, 45, 75, 90, 802, 24, 2, 66]
see radixSort(arr)
