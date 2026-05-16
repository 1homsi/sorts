def pancake_sort(arr):
    n = len(arr)
    for i in range(n, 1, -1):
        max_idx = max(range(i), key=lambda x: arr[x])
        if max_idx != i - 1:
            arr[:max_idx + 1] = arr[:max_idx + 1][::-1]
            arr[:i] = arr[:i][::-1]
    return arr
