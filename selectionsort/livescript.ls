selection-sort = (arr) ->
    n = arr.length
    for i from 0 to n - 1
        min-idx = i
        for j from i + 1 to n - 1
            min-idx = j if arr[j] < arr[min-idx]
        [arr[i], arr[min-idx]] = [arr[min-idx], arr[i]]
    arr
