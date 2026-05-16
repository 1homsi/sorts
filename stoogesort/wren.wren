class StoogeSort {
    static sort(arr, first, last) {
        if (arr[first] > arr[last]) {
            var tmp = arr[first]
            arr[first] = arr[last]
            arr[last] = tmp
        }
        if (last - first + 1 > 2) {
            var t = ((last - first + 1) * 2 / 3).floor
            StoogeSort.sort(arr, first, first + t - 1)
            StoogeSort.sort(arr, last - t + 1, last)
            StoogeSort.sort(arr, first, first + t - 1)
        }
    }
}

var arr = [3, 1, 4, 1, 5, 9, 2, 6]
StoogeSort.sort(arr, 0, arr.count - 1)
System.print(arr)
