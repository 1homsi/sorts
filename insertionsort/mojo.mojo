fn insertion_sort(inout arr: DynamicVector[Int]):
    let n = len(arr)
    for i in range(1, n):
        let key = arr[i]
        var j = i - 1
        while j >= 0 and arr[j] > key:
            arr[j + 1] = arr[j]
            j -= 1
        arr[j + 1] = key
