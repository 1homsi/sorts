selection_sort = (arr) ->
    n = #arr
    for i = 1, n - 1
        min_idx = i
        for j = i + 1, n
            min_idx = j if arr[j] < arr[min_idx]
        arr[i], arr[min_idx] = arr[min_idx], arr[i]
    arr
