function selectionSort(arr: int[]) -> (int[] result):
    int n = |arr|
    int i = 0
    while i < n:
        int min_idx = i
        int j = i + 1
        while j < n:
            if arr[j] < arr[min_idx]:
                min_idx = j
            j = j + 1
        int tmp = arr[i]
        arr[i] = arr[min_idx]
        arr[min_idx] = tmp
        i = i + 1
    return arr
