func stoogeSort(_ arr: inout [Int], _ first: Int, _ last: Int) {
    if arr[first] > arr[last] {
        arr.swapAt(first, last)
    }
    if last - first + 1 > 2 {
        let t = (last - first + 1) * 2 / 3
        stoogeSort(&arr, first, first + t - 1)
        stoogeSort(&arr, last - t + 1, last)
        stoogeSort(&arr, first, first + t - 1)
    }
}

var arr = [3, 1, 4, 1, 5, 9, 2, 6]
stoogeSort(&arr, 0, arr.count - 1)
print(arr)
