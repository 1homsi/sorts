func gnome_sort(arr: Array) -> Array:
    var i = 0
    var n = arr.size()
    while i < n:
        if i == 0 or arr[i] >= arr[i - 1]:
            i += 1
        else:
            var tmp = arr[i]
            arr[i] = arr[i - 1]
            arr[i - 1] = tmp
            i -= 1
    return arr
