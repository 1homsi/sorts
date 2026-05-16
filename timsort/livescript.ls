MIN_RUN = 32

insertion-sort = (arr, left, right) ->
    for i from left+1 to right
        key = arr[i]
        j = i - 1
        while j >= left and arr[j] > key
            arr[j+1] = arr[j]
            j--
        arr[j+1] = key

merge = (arr, left, mid, right) ->
    lp = arr[left to mid]slice!
    rp = arr[mid+1 to right]slice!
    i = 0; j = 0; k = left
    while i < lp.length and j < rp.length
        if lp[i] <= rp[j] then arr[k++] = lp[i++]
        else arr[k++] = rp[j++]
    while i < lp.length then arr[k++] = lp[i++]
    while j < rp.length then arr[k++] = rp[j++]

timsort = (arr) ->
    n = arr.length
    i = 0
    while i < n
        insertion-sort arr, i, Math.min(i + MIN_RUN - 1, n - 1)
        i += MIN_RUN
    size = MIN_RUN
    while size < n
        left = 0
        while left < n
            mid = Math.min left + size - 1, n - 1
            right = Math.min left + 2*size - 1, n - 1
            merge arr, left, mid, right if mid < right
            left += 2*size
        size *= 2
    arr

arr = [5, 2, 8, 1, 9, 3, 7, 4, 6]
console.log timsort arr
