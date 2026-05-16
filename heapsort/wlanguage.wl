PROCEDURE HeapSort(LOCAL arr, n)
    LOCAL i
    n = ArrayCount(arr)
    FOR i = n/2 - 1 TO 0 STEP -1
        SiftDown(arr, i, n)
    END
    FOR i = n - 1 TO 1 STEP -1
        temp = arr[0]
        arr[0] = arr[i]
        arr[i] = temp
        SiftDown(arr, 0, i)
    END
    FOR i = 1 TO n
        Trace(arr[i])
    END
END

PROCEDURE SiftDown(LOCAL arr, idx, n)
    LOCAL largest, left, right, temp
    largest = idx
    left = 2 * idx + 1
    right = 2 * idx + 2
    IF left < n AND arr[left] > arr[largest] THEN
        largest = left
    END
    IF right < n AND arr[right] > arr[largest] THEN
        largest = right
    END
    IF largest != idx THEN
        temp = arr[idx]
        arr[idx] = arr[largest]
        arr[largest] = temp
        SiftDown(arr, largest, n)
    END
END

LOCAL arr[6]
arr[1] = 5
arr[2] = 2
arr[3] = 8
arr[4] = 1
arr[5] = 9
arr[6] = 3
HeapSort(arr)
