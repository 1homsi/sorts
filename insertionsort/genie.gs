[indent=4]

def insertion_sort(arr: array of int): array of int
    n: int = arr.length
    for var i = 1 to (n - 1)
        key: int = arr[i]
        j: int = i - 1
        while j >= 0 and arr[j] > key
            arr[j + 1] = arr[j]
            j -= 1
        arr[j + 1] = key
    return arr
