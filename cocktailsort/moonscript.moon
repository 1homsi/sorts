cocktail_sort = (arr) ->
    swapped = true
    start = 1
    ending = #arr
    while swapped
        swapped = false
        for i = start, ending - 1
            if arr[i] > arr[i + 1]
                arr[i], arr[i + 1] = arr[i + 1], arr[i]
                swapped = true
        break unless swapped
        swapped = false
        ending -= 1
        for i = ending - 1, start, -1
            if arr[i] > arr[i + 1]
                arr[i], arr[i + 1] = arr[i + 1], arr[i]
                swapped = true
        start += 1
    arr
