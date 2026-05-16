comb-sort = (arr) ->
    n = arr.length
    gap = n
    sorted = false
    until sorted
        gap = Math.floor gap / 1.3
        if gap <= 1
            gap = 1
            sorted = true
        for i from 0 til n - gap
            if arr[i] > arr[i + gap]
                [arr[i], arr[i + gap]] = [arr[i + gap], arr[i]]
                sorted = false
    arr
