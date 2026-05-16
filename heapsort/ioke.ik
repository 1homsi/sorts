heapify = method(arr, n, i,
    largest = i
    left = 2 * i + 1
    right = 2 * i + 2
    if(left < n && arr[left] > arr[largest], largest = left)
    if(right < n && arr[right] > arr[largest], largest = right)
    if(largest != i,
        tmp = arr[i]
        arr[i] = arr[largest]
        arr[largest] = tmp
        heapify(arr, n, largest)
    )
)

heapsort = method(arr,
    n = arr length
    i = n / 2 - 1
    while(i >= 0,
        heapify(arr, n, i)
        i -= 1
    )
    i = n - 1
    while(i > 0,
        tmp = arr[0]
        arr[0] = arr[i]
        arr[i] = tmp
        heapify(arr, i, 0)
        i -= 1
    )
    arr
)

arr = [12, 11, 13, 5, 6, 7]
heapsort(arr) println
