insertionSort = method(arr,
    n = arr length
    1 to(n - 1) each(i,
        key = arr[i]
        j = i - 1
        while(j >= 0 && arr[j] > key,
            arr[j + 1] = arr[j]
            j = j - 1
        )
        arr[j + 1] = key
    )
    arr
)
