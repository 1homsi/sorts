class Quicksort {
    static Int partition(Int[] arr, Int low, Int high) {
        pivot := arr[high]
        i := low
        for (j := low; j < high; j++) {
            if (arr[j] <= pivot) {
                tmp := arr[i]; arr[i] = arr[j]; arr[j] = tmp
                i++
            }
        }
        tmp := arr[i]; arr[i] = arr[high]; arr[high] = tmp
        return i
    }

    static Void quicksort(Int[] arr, Int low, Int high) {
        if (low < high) {
            p := partition(arr, low, high)
            quicksort(arr, low, p - 1)
            quicksort(arr, p + 1, high)
        }
    }

    static Void main() {
        arr := [3, 6, 8, 10, 1, 2, 1]
        quicksort(arr, 0, arr.size - 1)
        echo(arr)
    }
}
