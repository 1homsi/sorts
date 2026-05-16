class BubbleSort {
    static Void bubbleSort(Int[] arr) {
        n := arr.size
        swapped := true
        while (swapped) {
            swapped = false
            (n-1).times |i| {
                if (arr[i] > arr[i+1]) {
                    tmp := arr[i]
                    arr[i] = arr[i+1]
                    arr[i+1] = tmp
                    swapped = true
                }
            }
            n--
        }
    }

    static Void main() {
        arr := [64, 34, 25, 12, 22, 11, 90]
        bubbleSort(arr)
        echo(arr)
    }
}
