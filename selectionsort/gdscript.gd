func selection_sort(arr: Array) -> Array:
    var n = arr.size()
    for i in range(n):
        var min_idx = i
        for j in range(i + 1, n):
            if arr[j] < arr[min_idx]:
                min_idx = j
        var tmp = arr[i]
        arr[i] = arr[min_idx]
        arr[min_idx] = tmp
    return arr
