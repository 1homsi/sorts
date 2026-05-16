proc stoogeSort(arr: var seq[int], first, last: int) =
    if arr[first] > arr[last]:
        swap(arr[first], arr[last])
    if last - first + 1 > 2:
        let t = (last - first + 1) * 2 div 3
        stoogeSort(arr, first, first + t - 1)
        stoogeSort(arr, last - t + 1, last)
        stoogeSort(arr, first, first + t - 1)

var arr = @[3, 1, 4, 1, 5, 9, 2, 6]
stoogeSort(arr, 0, arr.len - 1)
echo arr
