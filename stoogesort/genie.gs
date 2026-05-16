[indent=4]

def stooge_sort(arr: array of int, first: int, last: int)
    if arr[first] > arr[last]
        tmp: int = arr[first]
        arr[first] = arr[last]
        arr[last] = tmp
    n: int = last - first + 1
    if n > 2
        t: int = n * 2 / 3
        stooge_sort(arr, first, first + t - 1)
        stooge_sort(arr, last - t + 1, last)
        stooge_sort(arr, first, first + t - 1)

init
    arr: array of int = {3, 1, 4, 1, 5, 9, 2, 6}
    stooge_sort(arr, 0, arr.length - 1)
    for x in arr
        stdout.printf("%d ", x)
    stdout.printf("\n")
