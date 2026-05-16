def selection_sort(arr):
    let n = length(arr)
    for(n) i:
        var min_idx = i
        for(n - i - 1) k:
            let j = i + k + 1
            if arr[j] < arr[min_idx]:
                min_idx = j
        let tmp = arr[i]
        arr[i] = arr[min_idx]
        arr[min_idx] = tmp
    return arr
