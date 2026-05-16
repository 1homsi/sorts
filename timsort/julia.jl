const MIN_RUN = 32

function insertion_sort!(arr, left, right)
    for i in (left + 1):right
        key = arr[i]
        j = i - 1
        while j >= left && arr[j] > key
            arr[j + 1] = arr[j]
            j -= 1
        end
        arr[j + 1] = key
    end
end

function merge!(arr, left, mid, right)
    lp = copy(arr[left:mid])
    rp = copy(arr[(mid + 1):right])
    i, j, k = 1, 1, left
    while i <= length(lp) && j <= length(rp)
        if lp[i] <= rp[j]
            arr[k] = lp[i]; i += 1
        else
            arr[k] = rp[j]; j += 1
        end
        k += 1
    end
    while i <= length(lp); arr[k] = lp[i]; i += 1; k += 1; end
    while j <= length(rp); arr[k] = rp[j]; j += 1; k += 1; end
end

function timsort!(arr)
    n = length(arr)
    i = 1
    while i <= n
        insertion_sort!(arr, i, min(i + MIN_RUN - 1, n))
        i += MIN_RUN
    end
    size = MIN_RUN
    while size < n
        left = 1
        while left <= n
            mid = min(left + size - 1, n)
            right = min(left + 2 * size - 1, n)
            if mid < right; merge!(arr, left, mid, right); end
            left += 2 * size
        end
        size *= 2
    end
    arr
end

arr = [5, 2, 8, 1, 9, 3, 7, 4, 6]
println(timsort!(arr))
