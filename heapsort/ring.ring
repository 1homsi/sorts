func heapify arr, n, i
    largest = i
    left = 2 * i + 1
    right = 2 * i + 2
    if left < n and arr[left+1] > arr[largest+1]
        largest = left
    ok
    if right < n and arr[right+1] > arr[largest+1]
        largest = right
    ok
    if largest != i
        tmp = arr[i+1]
        arr[i+1] = arr[largest+1]
        arr[largest+1] = tmp
        heapify(arr, n, largest)
    ok

func heapsort arr
    n = len(arr)
    for i = n/2-1 to 0 step -1
        heapify(arr, n, i)
    next
    for i = n-1 to 1 step -1
        tmp = arr[1]
        arr[1] = arr[i+1]
        arr[i+1] = tmp
        heapify(arr, i, 0)
    next
    return arr

arr = [12, 11, 13, 5, 6, 7]
see heapsort(arr)
