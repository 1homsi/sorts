gnome_sort = (arr) ->
    n = #arr
    i = 1
    while i <= n
        if i == 1 or arr[i] >= arr[i - 1]
            i += 1
        else
            arr[i], arr[i - 1] = arr[i - 1], arr[i]
            i -= 1
    arr
