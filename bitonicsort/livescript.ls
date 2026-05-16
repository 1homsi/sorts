compare-and-swap = (arr, i, j, direction) ->
    if direction is (arr[i] > arr[j])
        [arr[i], arr[j]] = [arr[j], arr[i]]

bitonic-merge = (arr, lo, cnt, direction) ->
    if cnt > 1
        k = Math.floor cnt / 2
        for i from lo to lo + k - 1
            compare-and-swap arr, i, i + k, direction
        bitonic-merge arr, lo, k, direction
        bitonic-merge arr, lo + k, k, direction

bitonic-sort = (arr, lo, cnt, direction) ->
    if cnt > 1
        k = Math.floor cnt / 2
        bitonic-sort arr, lo, k, true
        bitonic-sort arr, lo + k, k, false
        bitonic-merge arr, lo, cnt, direction

data = [3, 7, 4, 8, 6, 2, 1, 5]
bitonic-sort data, 0, data.length, true
console.log data
