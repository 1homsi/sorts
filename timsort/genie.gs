[indent=4]

MIN_RUN:int = 32

def insertion_sort(arr:array of int, left:int, right:int)
    i:int = left + 1
    while i <= right
        key:int = arr[i]
        j:int = i - 1
        while j >= left and arr[j] > key
            arr[j+1] = arr[j]
            j -= 1
        arr[j+1] = key
        i += 1

def merge(arr:array of int, left:int, mid:int, right:int)
    ln:int = mid - left + 1
    rn:int = right - mid
    lp:array of int = new array of int[ln]
    rp:array of int = new array of int[rn]
    for i:int = 0 to (ln - 1)
        lp[i] = arr[left + i]
    for i:int = 0 to (rn - 1)
        rp[i] = arr[mid + 1 + i]
    i:int = 0
    j:int = 0
    k:int = left
    while i < ln and j < rn
        if lp[i] <= rp[j]
            arr[k] = lp[i]
            i += 1
        else
            arr[k] = rp[j]
            j += 1
        k += 1
    while i < ln
        arr[k] = lp[i]
        i += 1
        k += 1
    while j < rn
        arr[k] = rp[j]
        j += 1
        k += 1

def timsort(arr:array of int)
    n:int = arr.length
    i:int = 0
    while i < n
        right:int = int.min(i + MIN_RUN - 1, n - 1)
        insertion_sort(arr, i, right)
        i += MIN_RUN
    size:int = MIN_RUN
    while size < n
        left:int = 0
        while left < n
            mid:int = int.min(left + size - 1, n - 1)
            right:int = int.min(left + 2 * size - 1, n - 1)
            if mid < right
                merge(arr, left, mid, right)
            left += 2 * size
        size *= 2

init
    arr:array of int = {5, 2, 8, 1, 9, 3, 7, 4, 6}
    timsort(arr)
    for x in arr
        stdout.printf("%d ", x)
    stdout.printf("\n")
