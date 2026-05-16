func insertion_sort(arr: Array) -> Array:
    var n = arr.size()
    for i in range(1, n):
        var key = arr[i]
        var j = i - 1
        while j >= 0 and arr[j] > key:
            arr[j + 1] = arr[j]
            j -= 1
        arr[j + 1] = key
    return arr
