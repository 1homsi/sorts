import whiley.io.Writer

function partition(int[] arr, int low, int high) -> (int[] result, int p):
    int pivot = arr[high]
    int i = low
    int j = low
    while j < high:
        if arr[j] <= pivot:
            int tmp = arr[i]
            arr[i] = arr[j]
            arr[j] = tmp
            i = i + 1
        j = j + 1
    int tmp = arr[i]
    arr[i] = arr[high]
    arr[high] = tmp
    return arr, i

function quicksort(int[] arr, int low, int high) -> int[]:
    if low < high:
        int[] a
        int p
        a, p = partition(arr, low, high)
        a = quicksort(a, low, p - 1)
        a = quicksort(a, p + 1, high)
        return a
    return arr

method main(Writer.T out):
    int[] arr = [3, 6, 8, 10, 1, 2, 1]
    arr = quicksort(arr, 0, |arr| - 1)
    out->write(arr)
