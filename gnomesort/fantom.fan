class GnomeSort {
    static Int[] sort(Int[] arr) {
        i := 0
        n := arr.size
        while (i < n) {
            if (i == 0 || arr[i] >= arr[i - 1]) {
                i++
            } else {
                tmp := arr[i]
                arr[i] = arr[i - 1]
                arr[i - 1] = tmp
                i--
            }
        }
        return arr
    }
}
