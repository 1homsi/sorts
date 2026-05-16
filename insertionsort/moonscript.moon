insertion_sort = (arr) ->
    n = #arr
    for i = 2, n
        key = arr[i]
        j = i - 1
        while j >= 1 and arr[j] > key
            arr[j + 1] = arr[j]
            j -= 1
        arr[j + 1] = key
    arr
