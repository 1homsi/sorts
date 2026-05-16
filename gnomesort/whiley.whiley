function gnomeSort(int[] arr) -> (int[] result):
    int i = 0
    int n = |arr|
    while i < n:
        if i == 0 || arr[i] >= arr[i - 1]:
            i = i + 1
        else:
            int tmp = arr[i]
            arr[i] = arr[i - 1]
            arr[i - 1] = tmp
            i = i - 1
    return arr
