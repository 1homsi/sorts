[indent=4]
def selection_sort(arr: array of int): array of int
    n: int = arr.length
    for i: int = 0 to (n - 1)
        min_idx: int = i
        for j: int = (i + 1) to (n - 1)
            if arr[j] < arr[min_idx]
                min_idx = j
        tmp: int = arr[i]
        arr[i] = arr[min_idx]
        arr[min_idx] = tmp
    return arr
