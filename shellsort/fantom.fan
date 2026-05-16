class ShellSort {
    static Int[] shellSort(Int[] arr) {
        n := arr.size
        gap := n / 2
        while (gap > 0) {
            for (i := gap; i < n; ++i) {
                temp := arr[i]
                j := i
                while (j >= gap && arr[j - gap] > temp) {
                    arr[j] = arr[j - gap]
                    j -= gap
                }
                arr[j] = temp
            }
            gap /= 2
        }
        return arr
    }

    static Void main() {
        arr := [64, 34, 25, 12, 22, 11, 90]
        echo(shellSort(arr))
    }
}
