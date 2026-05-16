[indent=4]

def comb_sort(arr: array of int): array of int
    n: int = arr.length
    gap: int = n
    sorted: bool = false
    while not sorted
        gap = (int)(gap / 1.3)
        if gap <= 1
            gap = 1
            sorted = true
        for i: int = 0 to (n - gap - 1)
            if arr[i] > arr[i + gap]
                tmp: int = arr[i]
                arr[i] = arr[i + gap]
                arr[i + gap] = tmp
                sorted = false
    return arr
