stooge_sort = (arr, first, last) ->
    if arr[first] > arr[last]
        arr[first], arr[last] = arr[last], arr[first]
    n = last - first + 1
    if n > 2
        t = math.floor(n * 2 / 3)
        stooge_sort arr, first, first + t - 1
        stooge_sort arr, last - t + 1, last
        stooge_sort arr, first, first + t - 1

arr = {3, 1, 4, 1, 5, 9, 2, 6}
stooge_sort arr, 1, #arr
print table.concat(arr, " ")
