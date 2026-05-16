import std::io

function heapify(int[] arr, int n, int i) -> (int[] result):
    int largest = i
    int left = 2 * i + 1
    int right = 2 * i + 2
    if left < n && arr[left] > arr[largest]:
        largest = left
    if right < n && arr[right] > arr[largest]:
        largest = right
    if largest != i:
        int tmp = arr[i]
        arr[i] = arr[largest]
        arr[largest] = tmp
        arr = heapify(arr, n, largest)
    return arr

function heapsort(int[] arr) -> (int[] result):
    int n = |arr|
    int i = n / 2 - 1
    while i >= 0:
        arr = heapify(arr, n, i)
        i = i - 1
    i = n - 1
    while i > 0:
        int tmp = arr[0]
        arr[0] = arr[i]
        arr[i] = tmp
        arr = heapify(arr, i, 0)
        i = i - 1
    return arr

method main(System.Console console):
    int[] arr = [12, 11, 13, 5, 6, 7]
    arr = heapsort(arr)
    console.out.println(arr)
