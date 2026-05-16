selectionSort(arr, n):
    for i in 0..n-1:
        minIdx = i
        for j in i+1..n-1:
            if arr[j] < arr[minIdx]:
                minIdx = j
        tmp = arr[i]
        arr[i] = arr[minIdx]
        arr[minIdx] = tmp
    return arr
