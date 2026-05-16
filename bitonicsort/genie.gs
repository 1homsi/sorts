[indent=4]
uses GLib

def compare_and_swap(arr: array of int, i: int, j: int, direction: bool)
    if direction == (arr[i] > arr[j])
        tmp: int = arr[i]
        arr[i] = arr[j]
        arr[j] = tmp

def bitonic_merge(arr: array of int, lo: int, cnt: int, direction: bool)
    if cnt > 1
        k: int = cnt / 2
        for var i = lo to lo + k - 1
            compare_and_swap(arr, i, i + k, direction)
        bitonic_merge(arr, lo, k, direction)
        bitonic_merge(arr, lo + k, k, direction)

def bitonic_sort(arr: array of int, lo: int, cnt: int, direction: bool)
    if cnt > 1
        k: int = cnt / 2
        bitonic_sort(arr, lo, k, true)
        bitonic_sort(arr, lo + k, k, false)
        bitonic_merge(arr, lo, cnt, direction)

init
    data: array of int = {3, 7, 4, 8, 6, 2, 1, 5}
    bitonic_sort(data, 0, data.length, true)
    for x in data
        stdout.printf("%d ", x)
    print ""
