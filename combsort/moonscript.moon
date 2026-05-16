comb_sort = (arr) ->
    n = #arr
    gap = n
    sorted = false
    while not sorted
        gap = math.floor gap / 1.3
        if gap <= 1
            gap = 1
            sorted = true
        for i = 1, n - gap
            if arr[i] > arr[i + gap]
                arr[i], arr[i + gap] = arr[i + gap], arr[i]
                sorted = false
    arr
