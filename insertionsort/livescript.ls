insertion-sort = (arr) ->
    for i from 1 to arr.length - 1
        key = arr[i]
        j = i - 1
        while j >= 0 and arr[j] > key
            arr[j + 1] = arr[j]
            j--
        arr[j + 1] = key
    arr
