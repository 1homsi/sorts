[indent=4]

def partition(arr: array of int, low: int, high: int): int
    pivot: int = arr[high]
    i: int = low
    for j: int = low to high - 1
        if arr[j] <= pivot
            tmp: int = arr[i]
            arr[i] = arr[j]
            arr[j] = tmp
            i++
    tmp: int = arr[i]
    arr[i] = arr[high]
    arr[high] = tmp
    return i

def quicksort(arr: array of int, low: int, high: int)
    if low < high
        p: int = partition(arr, low, high)
        quicksort(arr, low, p - 1)
        quicksort(arr, p + 1, high)

init
    arr: array of int = {3, 6, 8, 10, 1, 2, 1}
    quicksort(arr, 0, arr.length - 1)
    for x in arr
        stdout.printf("%d ", x)
    print ""
