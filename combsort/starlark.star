def comb_sort(arr):
    n = len(arr)
    gap = n
    sorted_ = False
    while not sorted_:
        gap = int(gap / 1.3)
        if gap <= 1:
            gap = 1
            sorted_ = True
        for i in range(n - gap):
            if arr[i] > arr[i + gap]:
                arr[i], arr[i + gap] = arr[i + gap], arr[i]
                sorted_ = False
    return arr
