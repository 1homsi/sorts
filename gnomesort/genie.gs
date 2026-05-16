[indent=4]
def gnome_sort(arr: array of int): array of int
    i: int = 0
    n: int = arr.length
    while i < n
        if i == 0 or arr[i] >= arr[i - 1]
            i++
        else
            tmp: int = arr[i]
            arr[i] = arr[i - 1]
            arr[i - 1] = tmp
            i--
    return arr
