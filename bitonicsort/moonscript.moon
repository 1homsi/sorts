compare_and_swap = (arr, i, j, direction) ->
    if direction == (arr[i] > arr[j])
        arr[i], arr[j] = arr[j], arr[i]

bitonic_merge = (arr, lo, cnt, direction) ->
    if cnt > 1
        k = math.floor cnt / 2
        for i = lo, lo + k - 1
            compare_and_swap arr, i, i + k, direction
        bitonic_merge arr, lo, k, direction
        bitonic_merge arr, lo + k, k, direction

bitonic_sort = (arr, lo, cnt, direction) ->
    if cnt > 1
        k = math.floor cnt / 2
        bitonic_sort arr, lo, k, true
        bitonic_sort arr, lo + k, k, false
        bitonic_merge arr, lo, cnt, direction

data = {3, 7, 4, 8, 6, 2, 1, 5}
bitonic_sort data, 1, #data, true
print table.concat data, " "
