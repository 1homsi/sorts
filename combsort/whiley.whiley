function combSort(int[] arr) -> (int[] result):
    int n = |arr|
    int gap = n
    bool sorted = false
    while !sorted:
        gap = (gap * 10) / 13
        if gap <= 1:
            gap = 1
            sorted = true
        int i = 0
        while i + gap < n:
            if arr[i] > arr[i + gap]:
                int tmp = arr[i]
                arr[i] = arr[i + gap]
                arr[i + gap] = tmp
                sorted = false
            i = i + 1
    return arr
