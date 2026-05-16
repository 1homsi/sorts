SelectionSort(ARRAY arr)
LOCAL INT i, j, minIdx, n, tmp

n = ArrayCount(arr)
FOR i = 1 TO n - 1
    minIdx = i
    FOR j = i + 1 TO n
        IF arr[j] < arr[minIdx]
            minIdx = j
        END
    END
    tmp = arr[i]
    arr[i] = arr[minIdx]
    arr[minIdx] = tmp
END

RETURN arr
END