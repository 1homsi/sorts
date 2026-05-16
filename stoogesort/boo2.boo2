def stooge_sort(arr as (int), first as int, last as int):
    if arr[first] > arr[last]:
        tmp = arr[first]
        arr[first] = arr[last]
        arr[last] = tmp
    n = last - first + 1
    if n > 2:
        t = n * 2 / 3
        stooge_sort(arr, first, first + t - 1)
        stooge_sort(arr, last - t + 1, last)
        stooge_sort(arr, first, first + t - 1)

arr = array(int, (3, 1, 4, 1, 5, 9, 2, 6))
stooge_sort(arr, 0, len(arr) - 1)
print arr
