[indent=4]

def is_sorted(arr: array of int): bool
    for i: int = 0 to (arr.length - 2)
        if arr[i] > arr[i + 1]
            return false
    return true

def shuffle(arr: array of int)
    n: int = arr.length
    for i: int = (n - 1) downto 1
        j: int = Random.int_range(0, i + 1)
        tmp: int = arr[i]
        arr[i] = arr[j]
        arr[j] = tmp

def bogosort(arr: array of int)
    while not is_sorted(arr)
        shuffle(arr)

init
    arr: array of int = {3, 1, 4, 1, 5, 9, 2, 6}
    bogosort(arr)
    for v in arr
        stdout.printf("%d ", v)
    print ""
