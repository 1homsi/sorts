function cocktailSort(int[] arr) -> (int[] result):
    int n = |arr|
    bool swapped = true
    int start = 0
    int end = n - 1
    while swapped:
        swapped = false
        int i = start
        while i < end:
            if arr[i] > arr[i + 1]:
                int tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = true
            i = i + 1
        if !swapped:
            return arr
        swapped = false
        end = end - 1
        i = end - 1
        while i >= start:
            if arr[i] > arr[i + 1]:
                int tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = true
            i = i - 1
        start = start + 1
    return arr
