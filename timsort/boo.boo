MIN_RUN = 32

def insertion_sort(arr as List, left as int, right as int):
    for i in range(left + 1, right + 1):
        key = arr[i]
        j = i - 1
        while j >= left and arr[j] > key:
            arr[j + 1] = arr[j]
            j -= 1
        arr[j + 1] = key

def merge(arr as List, left as int, mid as int, right as int):
    lp = arr[left:mid + 1][:]
    rp = arr[mid + 1:right + 1][:]
    i = 0; j = 0; k = left
    while i < len(lp) and j < len(rp):
        if lp[i] <= rp[j]:
            arr[k] = lp[i]; i += 1
        else:
            arr[k] = rp[j]; j += 1
        k += 1
    while i < len(lp): arr[k] = lp[i]; i += 1; k += 1
    while j < len(rp): arr[k] = rp[j]; j += 1; k += 1

def timsort(arr as List) as List:
    n = len(arr)
    i = 0
    while i < n:
        insertion_sort(arr, i, min(i + MIN_RUN - 1, n - 1))
        i += MIN_RUN
    size = MIN_RUN
    while size < n:
        left = 0
        while left < n:
            mid = min(left + size - 1, n - 1)
            right = min(left + 2 * size - 1, n - 1)
            if mid < right: merge(arr, left, mid, right)
            left += 2 * size
        size *= 2
    return arr

arr = [5, 2, 8, 1, 9, 3, 7, 4, 6]
print timsort(arr)
