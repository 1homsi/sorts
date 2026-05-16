class StoogeSort {
    static Void stoogeSort(Int[] arr, Int first, Int last) {
        if (arr[first] > arr[last]) {
            tmp := arr[first]
            arr[first] = arr[last]
            arr[last] = tmp
        }
        n := last - first + 1
        if (n > 2) {
            t := n * 2 / 3
            stoogeSort(arr, first, first + t - 1)
            stoogeSort(arr, last - t + 1, last)
            stoogeSort(arr, first, first + t - 1)
        }
    }

    static Void main() {
        arr := Int[3, 1, 4, 1, 5, 9, 2, 6]
        stoogeSort(arr, 0, arr.size - 1)
        echo(arr)
    }
}
