func combSort arr
    n = len(arr)
    gap = n
    sorted = false
    while not sorted
        gap = floor(gap / 1.3)
        if gap <= 1
            gap = 1
            sorted = true
        ok
        for i = 1 to n - gap
            if arr[i] > arr[i + gap]
                tmp = arr[i]
                arr[i] = arr[i + gap]
                arr[i + gap] = tmp
                sorted = false
            ok
        next
    end
    return arr
