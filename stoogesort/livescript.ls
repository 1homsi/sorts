stooge-sort = (arr, first, last) ->
    if arr[first] > arr[last]
        [arr[first], arr[last]] = [arr[last], arr[first]]
    n = last - first + 1
    if n > 2
        t = Math.floor(n * 2 / 3)
        stooge-sort arr, first, first + t - 1
        stooge-sort arr, last - t + 1, last
        stooge-sort arr, first, first + t - 1

arr = [3, 1, 4, 1, 5, 9, 2, 6]
stooge-sort arr, 0, arr.length - 1
console.log arr
