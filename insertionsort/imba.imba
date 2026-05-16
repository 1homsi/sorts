def insertion_sort arr
    let n = arr.length
    for i in [1...n]
        let key = arr[i]
        var j = i - 1
        while j >= 0 and arr[j] > key
            arr[j + 1] = arr[j]
            j -= 1
        arr[j + 1] = key
    arr
