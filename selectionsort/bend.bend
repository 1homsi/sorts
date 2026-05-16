def selection_sort(arr):
    n = len(arr)
    use result = arr
    for i in range(n):
        use min_idx = i
        for j in range(i + 1, n):
            if arr[j] < arr[min_idx]:
                min_idx = j
        tmp = arr[i]
        arr[i] = arr[min_idx]
        arr[min_idx] = tmp
    return result
