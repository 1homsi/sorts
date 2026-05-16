cocktail-sort = (arr) ->
    swapped = true
    start = 0
    end = arr.length - 1
    while swapped
        swapped = false
        for i from start to end - 1
            if arr[i] > arr[i + 1]
                [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]]
                swapped = true
        break unless swapped
        swapped = false
        end--
        for i from end - 1 to start by -1
            if arr[i] > arr[i + 1]
                [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]]
                swapped = true
        start++
    arr
