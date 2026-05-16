def combSort(arr as (int)) as (int):
    n = len(arr)
    gap = n
    sorted = false
    while not sorted:
        gap = int(gap / 1.3)
        if gap <= 1:
            gap = 1
            sorted = true
        for i in range(n - gap):
            if arr[i] > arr[i + gap]:
                tmp = arr[i]
                arr[i] = arr[i + gap]
                arr[i + gap] = tmp
                sorted = false
    return arr
