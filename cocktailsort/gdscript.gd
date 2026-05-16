func cocktail_sort(arr: Array) -> Array:
    var swapped := true
    var start := 0
    var ending := arr.size() - 1
    while swapped:
        swapped = false
        for i in range(start, ending):
            if arr[i] > arr[i + 1]:
                var tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = true
        if not swapped:
            break
        swapped = false
        ending -= 1
        var i := ending - 1
        while i >= start:
            if arr[i] > arr[i + 1]:
                var tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = true
            i -= 1
        start += 1
    return arr
