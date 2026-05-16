def insertion_sort: arr {
    n = arr size
    1 upto: (n - 1) do: |i| {
        key = arr[i]
        j = i - 1
        { (j >= 0) && (arr[j] > key) } whileTrue: {
            arr[j + 1] = arr[j]
            j = j - 1
        }
        arr[j + 1] = key
    }
    arr
}
