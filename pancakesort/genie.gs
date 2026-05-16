[indent=4]

def flip(arr: array of int, k: int)
    left: int = 0
    right: int = k
    while left < right
        tmp: int = arr[left]
        arr[left] = arr[right]
        arr[right] = tmp
        left++
        right--

def pancake_sort(arr: array of int)
    size: int = arr.length
    while size > 1
        max_idx: int = 0
        for i: int = 1 to size - 1
            if arr[i] > arr[max_idx]
                max_idx = i
        if max_idx != size - 1
            if max_idx != 0
                flip(arr, max_idx)
            flip(arr, size - 1)
        size--

init
    arr: array of int = {3, 6, 2, 7, 4, 1, 5}
    pancake_sort(arr)
    for v in arr
        stdout.printf("%d ", v)
    stdout.printf("\n")
