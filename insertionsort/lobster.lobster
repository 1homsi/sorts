def insertion_sort(arr):
    let n = length(arr)
    for i in 1 .. n - 1:
        let key = arr[i]
        var j = i - 1
        while j >= 0 and arr[j] > key:
            arr[j + 1] = arr[j]
            j -= 1
        arr[j + 1] = key
    arr
