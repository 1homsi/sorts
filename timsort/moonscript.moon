MIN_RUN = 32

insertion_sort = (arr, left, right) ->
    i = left + 1
    while i <= right
        key = arr[i]
        j = i - 1
        while j >= left and arr[j] > key
            arr[j+1] = arr[j]
            j -= 1
        arr[j+1] = key
        i += 1

merge = (arr, left, mid, right) ->
    lp = {arr[i] for i = left, mid}
    rp = {arr[i] for i = mid+1, right}
    i, j, k = 1, 1, left
    while i <= #lp and j <= #rp
        if lp[i] <= rp[j]
            arr[k] = lp[i]; i += 1
        else
            arr[k] = rp[j]; j += 1
        k += 1
    while i <= #lp do arr[k] = lp[i]; i += 1; k += 1
    while j <= #rp do arr[k] = rp[j]; j += 1; k += 1

timsort = (arr) ->
    n = #arr
    i = 1
    while i <= n
        right = math.min(i + MIN_RUN - 1, n)
        insertion_sort arr, i, right
        i += MIN_RUN
    size = MIN_RUN
    while size < n
        left = 1
        while left <= n
            mid = math.min(left + size - 1, n)
            right = math.min(left + 2*size - 1, n)
            merge(arr, left, mid, right) if mid < right
            left += 2*size
        size *= 2
    arr

arr = {5, 2, 8, 1, 9, 3, 7, 4, 6}
print table.concat(timsort(arr), " ")
