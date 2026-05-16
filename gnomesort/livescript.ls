gnome-sort = (arr) ->
    i = 0
    n = arr.length
    while i < n
        if i is 0 or arr[i] >= arr[i - 1]
            i++
        else
            [arr[i], arr[i - 1]] = [arr[i - 1], arr[i]]
            i--
    arr
