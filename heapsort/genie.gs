[indent=4]

def heapify(arr: array of int, n: int, i: int)
    largest: int = i
    left: int = 2*i+1
    right: int = 2*i+2
    if left < n and arr[left] > arr[largest]
        largest = left
    if right < n and arr[right] > arr[largest]
        largest = right
    if largest != i
        tmp: int = arr[i]
        arr[i] = arr[largest]
        arr[largest] = tmp
        heapify(arr, n, largest)

def heapsort(arr: array of int)
    n: int = arr.length
    i: int = n/2 - 1
    while i >= 0
        heapify(arr, n, i)
        i--
    i = n - 1
    while i > 0
        tmp: int = arr[0]
        arr[0] = arr[i]
        arr[i] = tmp
        heapify(arr, i, 0)
        i--

init
    arr: array of int = {12, 11, 13, 5, 6, 7}
    heapsort(arr)
    for x in arr
        stdout.printf("%d ", x)
    stdout.printf("\n")
