def selectionSort(arr)
    let n = arr.length
    for i in [0...n]
        let minIdx = i
        for j in [i+1...n]
            if arr[j] < arr[minIdx]
                minIdx = j
        let tmp = arr[i]
        arr[i] = arr[minIdx]
        arr[minIdx] = tmp
    return arr
